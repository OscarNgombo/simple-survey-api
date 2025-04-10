# Simple Survey API

A Django REST Framework application for creating and managing simple surveys.

## Project Artifacts

The following project artifacts are included to aid understanding and setup:

1.  **ERD Diagram:** (`./docs/ERD Diagram.pdf`) - Visual representation of the database schema.
2.  **Database SQL File:** (`./docs/sky_world_db.sql`) - SQL script to set up the database schema or initial data.
3.  **REST API Code:** (This repository) - The source code for the Django application.
4.  **Postman Collection:** (`./docs/survey_api.postman_collection.json`) - A collection of pre-built requests to test the API endpoints using Postman.

## Prerequisites

Before you begin, ensure you have the following installed:

*   Python (3.10+ recommended, as Django 5.2 requires it)
*   `pip` (Python package installer)
*   Git
*   MySQL Server

## Local Setup and Running

Follow these steps to set up and run the application on your local machine:

1.  **Clone the Repository:**
    ```bash
    git clone https://github.com/OscarNgombo/simple-survey-api.git
    cd simple-survey-api
    ```

2.  **Create and Activate Virtual Environment:**
    ```bash
    # Create virtual environment
    python -m venv venv

    # Activate virtual environment
    # Windows
    venv\Scripts\activate
    # macOS/Linux
    source venv/bin/activate
    ```

3.  **Install Dependencies:**
    *   Install the requirements:
        ```bash
        pip install -r requirements.txt
        ```

4.  **Database Setup:**
    *   Ensure your MySQL server is running.
    *   Connect to your MySQL server using a client (e.g., `mysql` command line, MySQL Workbench).
    *   Create the database specified in `settings.py`:
        ```sql
        CREATE DATABASE sky_survey_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
        ```
    *   **Important Security Note:** The `settings.py` file currently contains hardcoded database credentials (`root`/`0284`). This is **not recommended** for security reasons, especially if sharing the code. Consider using environment variables or a local settings file (`local_settings.py`) excluded from Git to manage sensitive information. For this local setup guide, we'll assume the credentials in `settings.py` are intended for local development.
    *   *Optional:* If you have a `sky_world_db.sql` file for schema setup (beyond migrations) or initial data, you can import it:
        ```bash
        mysql -u root -p sky_survey_db < path/to/your/sky_world_db.sql
        ```
        (You will be prompted for the password '0284').

5.  **Apply Migrations:**
    Run Django migrations to set up the database tables based on your models:
    ```bash
    python manage.py migrate
    ```

6.  **Create Superuser (Optional):**
    To access the Django admin interface:
    ```bash
    python manage.py createsuperuser
    ```
    Follow the prompts to create an admin user.

7.  **Run the Development Server:**
    ```bash
    python manage.py runserver
    ```
    The application should now be running at `http://127.0.0.1:8000/`.

8.  **API Testing:**
    *   Access the API endpoints (e.g., `http://127.0.0.1:8000/api/...` - adjust the base path according to your `config/urls.py` and `survey/urls.py`).
    *   Import the provided Postman collection (`survey_api.postman_collection.json`) into Postman to easily test the available endpoints.

## Deployment to PythonAnywhere

This section outlines the general steps taken to deploy the backend API to PythonAnywhere. Replace placeholders like `your-username` and `your-domain.pythonanywhere.com` with your actual PythonAnywhere details.

1.  **Sign Up/Log In:** Ensure you have a PythonAnywhere account.

2.  **Upload Code:**
    *   Open a **Bash Console** on PythonAnywhere.
    *   Clone your repository:
        ```bash
        git clone https://github.com/OscarNgombo/simple-survey-api.git
        cd simple-survey-api
        ```
    *   *(Alternative)*: Upload your project code as a zip file and extract it.

3.  **Create Virtual Environment:**
    *   In the Bash console, navigate to your project directory (`simple-survey-api`).
    *   Create a virtual environment using the desired Python version available on PythonAnywhere (e.g., 3.10):
        ```bash
        mkvirtualenv --python=/usr/bin/python3.10 myenv  # Choose a name like 'myenv'
        ```
    *   The environment activates automatically. To activate it later: `workon myenv`.

4.  **Install Dependencies:**
    ```bash
    pip install -r requirements.txt
    ```
    *(Note: Ensure `mysqlclient` is compatible with the PythonAnywhere environment. You might need to install system libraries first if issues arise, though PythonAnywhere often has common ones pre-installed).*

5.  **Database Setup (PythonAnywhere MySQL):**
    *   Go to the **Databases** tab on PythonAnywhere.
    *   Create a new MySQL database. Set a password.
    *   Note down the **database hostname**, **username**, and **database name** provided by PythonAnywhere (they will differ from your local setup).

6.  **Configure Settings for Production:**
    *   **Security Best Practice:** Do *not* commit sensitive production settings directly into `settings.py`. Use environment variables. You can set these in the PythonAnywhere **Web** tab's "Environment variables" section or within your WSGI file.
    *   Edit your `config/settings.py` (or preferably, use environment variables):
        *   `SECRET_KEY`: **Generate a new, strong secret key** for production. Do *not* use the insecure development key. Store it as an environment variable.
        *   `DEBUG = False`
        *   `ALLOWED_HOSTS = ['your-username.pythonanywhere.com', 'www.your-domain.com']` (Add your PythonAnywhere domain and any custom domain).
        *   `DATABASES`: Update the 'default' database settings with the credentials obtained from the PythonAnywhere Databases tab. Use environment variables for `NAME`, `USER`, `PASSWORD`, `HOST`.
            ```python
            # Example using os.environ.get() - set these variables in PythonAnywhere
            import os

            DATABASES = {
                'default': {
                    'ENGINE': 'django.db.backends.mysql',
                    'NAME': os.environ.get('DB_NAME'),
                    'USER': os.environ.get('DB_USER'),
                    'PASSWORD': os.environ.get('DB_PASSWORD'),
                    'HOST': os.environ.get('DB_HOST'),
                    'PORT': '3306',
                     'OPTIONS': {
                         'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",
                     },
                }
            }
            ```
        *   Ensure `STATIC_ROOT` is correctly set (it seems okay in your provided file):
            ```python
            STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
            ```

7.  **Apply Migrations (Production Database):**
    *   In your PythonAnywhere Bash console (with the virtual environment activated):
        ```bash
        python manage.py migrate
        ```

8.  **Collect Static Files:**
    *   In the Bash console:
        ```bash
        python manage.py collectstatic
        ```
    *   This will gather all static files into the directory specified by `STATIC_ROOT` (`staticfiles`).

9.  **Configure Web App (PythonAnywhere Web Tab):**
    *   Go to the **Web** tab on PythonAnywhere.
    *   Click **Add a new web app**.
    *   Select **Manual configuration** (or choose the Django framework if preferred, but manual gives more control).
    *   Select the Python version matching your virtual environment (e.g., Python 3.10).
    *   **Virtualenv:** Enter the path to your virtual environment, e.g., `/home/your-username/.virtualenvs/myenv`.
    *   **Code (Source code / Working directory):** Set the path to your project's root directory, e.g., `/home/your-username/simple-survey-api`.
    *   **WSGI configuration file:** Click the link to edit the file (e.g., `/var/www/your_username_pythonanywhere_com_wsgi.py`).
        *   Modify the WSGI file to point to your Django project's `wsgi.py`. Uncomment/edit the Django section. It should look something like this:
            ```python
            import os
            import sys

            # Add the project path to the system path
            path = '/home/your-username/simple-survey-api' # CHANGE THIS TO YOUR PROJECT PATH
            if path not in sys.path:
                sys.path.insert(0, path)

            # Add the parent directory of the wsgi.py file (where settings.py is)
            # This assumes your wsgi.py is in the 'config' directory
            sys.path.insert(0, os.path.join(path, 'config')) # CHANGE 'config' if needed

            # Set the DJANGO_SETTINGS_MODULE environment variable
            os.environ['DJANGO_SETTINGS_MODULE'] = 'config.settings' # CHANGE 'config' if needed

            # Activate virtualenv if needed (PythonAnywhere often handles this, but explicit is safe)
            # activate_this = '/home/your-username/.virtualenvs/myenv/bin/activate_this.py'
            # try:
            #     with open(activate_this) as f:
            #         exec(f.read(), dict(__file__=activate_this))
            # except FileNotFoundError:
            #     pass

            # Import the Django WSGI application handler
            from django.core.wsgi import get_wsgi_application
            application = get_wsgi_application()
            ```
        *   **Important:** Ensure the paths and module names (`config.settings`, `config`) match your project structure exactly.
        *   Save the WSGI file.
    *   **Static files:**
        *   Add a mapping:
            *   URL: `/static/`
            *   Directory: `/home/your-username/simple-survey-api/staticfiles` (the `STATIC_ROOT` path)
        *   Add another mapping for Media files if your application serves user-uploaded files:
            *   URL: `/media/`
            *   Directory: `/home/your-username/simple-survey-api/media` (the `MEDIA_ROOT` path)

10. **Set Environment Variables (Web Tab):**
    *   Scroll down to the "Environment variables" section on the Web tab.
    *   Add variables for `SECRET_KEY`, `DB_NAME`, `DB_USER`, `DB_PASSWORD`, `DB_HOST`.

11. **Reload Web App:**
    *   Go back to the **Web** tab and click the **Reload** button for your domain.

12. **Troubleshooting:**
    *   Check the **Error log** and **Server log** links on the Web tab if you encounter issues (e.g., 500 errors). They provide valuable debugging information.
    *   Ensure file permissions are correct if you encounter permission errors.

Your API should now be live at `your-username.pythonanywhere.com`.
