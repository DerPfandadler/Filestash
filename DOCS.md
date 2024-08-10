# Filestash Add-on Documentation

## Overview

This guide will help you set up and configure the Filestash add-on for Home Assistant. After installing the add-on, follow these steps to configure it according to your needs.

## Installation Guide

### Prerequisites

Ensure that your Home Assistant instance is up and running. This add-on supports multiple architectures, including `aarch64`, `amd64`, `armv7`, `armhf`, and `i386`.

### Installation Steps

1. **Add the Repository**:
   - In Home Assistant, navigate to **Settings > Add-ons > Repositories**.
   - Add the repository URL: `https://github.com/DerPfandadler/My-Addons`.

2. **Install the Add-on**:
   - Locate the "Filestash" add-on in the Add-on Store.
   - Click "Install" to begin the installation process.

3. **Start the Add-on**:
   - After installation, configure the necessary options.
   - Start the add-on by clicking the "Start" button.

## Configuration Options

After installation, you can configure the following options in the Home Assistant UI:

- **application_url**: Base URL where Filestash will be accessible.
- **gdrive_client_id**: Google Drive integration Client ID.
- **gdrive_client_secret**: Google Drive integration Client Secret.
- **dropbox_client_id**: Dropbox integration Client ID.
- **onlyoffice_url**: URL where the OnlyOffice Document Server will be accessed.
- **filestash_port**: Port on which Filestash will run (default: 8334).
- **onlyoffice_port**: Port on which OnlyOffice will run (default: 8088).

## Accessing Filestash

Once the add-on is started, you can access Filestash via your web browser at `http://[YOUR_HA_IP]:8334`. The OnlyOffice Document Server will be accessible at `http://[YOUR_HA_IP]:8088`.

## Troubleshooting

- **Logs**: Check the add-on logs under **Supervisor > Add-ons > Filestash > Logs** for any issues.
- **Ports**: Ensure that the configured ports are not being used by other services.
- **Environment Variables**: Double-check the configuration options for any typos or incorrect values.

## Frequently Asked Questions

- **How do I access cloud storage services?**
  - Provide your cloud service credentials (like Google Drive or Dropbox) in the configuration options.

- **Can I customize the UI?**
  - Filestash offers some customization options within its settings after you log in.

## Additional Resources

- [Filestash Official Website](https://www.filestash.app/)
- [OnlyOffice Document Server](https://www.onlyoffice.com/)

## Support

For more help or to report issues, visit the [GitHub repository](https://github.com/DerPfandadler/My-Addons).
