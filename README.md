# AI Detector Database Setup

This project contains Docker Compose configuration to run the AI Detector database.

## How to start the database

To start the database, please run the appropriate script depending on your operating system:

### On Windows

Run the `db-run.bat` script by double-clicking it or executing it in the Command Prompt:

```bat
db-run.bat

```
### On Linux or macOS
Run the `db-run.sh` script in your terminal:

```bash
db-run.sh
```

# Adding .env file
Before running the scripts, ensure you have a `.env` file in the db-changes directory. You can copy that file from files in Teams, Discord or create it manually with the necessary environment variables.

### Pro Tip
Remember that you have to have Docker installed and running on your machine for the scripts to work properly and the Docker Compose for linux/macOS users.