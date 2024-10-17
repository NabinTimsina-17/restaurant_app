# Restaurant Application

A mobile application to manage restaurant operations, allowing staff to handle table statuses, kitchen orders, and admin tasks in real-time.

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Screenshots](#screenshots)
- [Installation](#installation)
- [Usage](#usage)
- [Technologies Used](#technologies-used)
- [Flow Descriptions](#flow-descriptions)
- [Folder Structure](#folder-structure)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgments](#acknowledgments)

## Project Overview

The Restaurant Application is designed to help restaurant staff manage various operations efficiently. It is divided into three main flows:
1. **Reception Flow**: Manages table statuses and notifications.
2. **Kitchen Flow**: Handles incoming orders and keeps track of kitchen tasks.
3. **Admin Flow**: Manages users and notifications.

## Features

- View and manage restaurant tables with real-time status updates.
- Filter tables by status: *Occupied*, *Empty*, *Order Placed*, *To Clean*.
- Update table statuses through a dropdown with confirmation prompts.
- Kitchen staff can view incoming orders and update the order status.
- Admins can manage users and receive notifications.
- Real-time status updates across the reception, kitchen, and admin panels.
- View the total count of tables in each status category.

## Screenshots

| Reception Flow | Kitchen Flow | Admin Flow |
|----------------|--------------|------------|
| ![Reception Flow](assets/screenshots/) | ![Kitchen Flow](path/to/kitchen_screenshot.png) | ![Admin Flow](path/to/admin_screenshot.png) |

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/restaurant_application.git
   ```

2. Navigate to the project directory:
   ```bash
   cd restaurant_application
   ```

3. Install the dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Usage

- **Reception Flow**: 
  - Displays a list of tables with their current statuses.
  - Use the filter buttons to view tables by their status.
  - Tap on a table's status dropdown to change the status. A confirmation prompt will appear.
  - Total counts for each status are displayed next to the filter buttons.

- **Kitchen Flow**: 
  - View all incoming orders and their statuses.
  - Update the order status to *Preparing*, *Ready*, or *Served* as per the workflow.

- **Admin Flow**: 
  - Manage users and their roles within the app.
  - Receive and manage notifications related to operations.

## Technologies Used

- **Flutter**: UI framework for building the app.
- **Dart**: Programming language for Flutter.
- **Firebase Authentication**: Used for user sign-in and sign-up.
- **Fluttertoast**: To display toast notifications.
- **Material Design**: For UI components.

## Flow Descriptions

### Reception Flow
- **Loading Screen**: Displays the app logo upon startup.
- **Sign-In Screen**: Receptionists sign in using Firebase Authentication.
- **Home Screen**: Shows all the tables with their statuses.
- **Filter Options**: Allows filtering tables by their current status (*Occupied*, *Empty*, etc.).
- **Notifications**: Receptionists can view and manage notifications related to table statuses.

### Kitchen Flow
- **Order Management**: Displays all incoming orders along with the current order status.
- **Order Details**: Kitchen staff can view the details of each order.
- **Status Update**: Orders can be updated as *Preparing*, *Ready*, or *Served*.
- **Notifications**: The kitchen receives notifications for new orders or status changes.

### Admin Flow
- **User Management**: Admins can manage user roles within the application (e.g., receptionist, kitchen staff).
- **Notification Center**: Admins can view notifications related to user activity and system updates.
- **Overview**: Provides a dashboard view of restaurant activities and operations.

## Folder Structure

```
restaurant_application/
│
├── lib/
│   ├── main.dart             # Entry point of the application
│   ├── reception_flow/        # Contains all reception flow related screens
│   ├── kitchen_flow/          # Contains all kitchen flow related screens
│   ├── admin_flow/            # Contains all admin flow related screens
│   └── widgets/               # Custom widgets used in the app
├── assets/
│   └── images/                # App images (e.g., logos, icons)
└── pubspec.yaml               # Project dependencies and assets
```

## Contributing

Contributions are welcome! If you'd like to contribute, please fork the repository, make changes, and submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to the Flutter and Dart communities for their excellent documentation and support.
- Special thanks to Firebase for providing the backend services.

---

You can now replace the placeholders like `path/to/reception_screenshot.png`, `path/to/kitchen_screenshot.png`, etc., with the actual paths to your screenshots.