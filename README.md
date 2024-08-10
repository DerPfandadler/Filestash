# Filestash with OnlyOffice Home Assistant Addon

This add-on integrates Filestash, a web-based file manager, with OnlyOffice Document Server for in-browser document editing.

## Installation

1. Add this repository to your Home Assistant.
2. Navigate to the Add-on Store in Home Assistant.
3. Install the "Filestash with OnlyOffice" add-on.

## Configuration

- **application_url**: The base URL for accessing Filestash.
- **gdrive_client_id**: Your Google Drive Client ID for integration.
- **gdrive_client_secret**: Your Google Drive Client Secret.
- **dropbox_client_id**: Your Dropbox Client ID.
- **onlyoffice_url**: The URL where OnlyOffice Document Server will be accessed.
- **filestash_port**: The port on which Filestash will run (default: 8334).
- **onlyoffice_port**: The port on which OnlyOffice will run (default: 8088).

## Usage

After installation, start the add-on and access Filestash at `http://[YOUR_HA_IP]:8334`. OnlyOffice will be accessible at `http://[YOUR_HA_IP]:8088`.