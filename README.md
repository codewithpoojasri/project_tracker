# Project Tracker

## Project Description

The **Project Tracker** application is a robust and user-friendly tool designed to help teams and individuals manage their projects efficiently. Built with modern technologies, the app allows users to create, update, and monitor project milestones, tasks, and deadlines in a streamlined interface.

### Key Features:

- **Task Management**: Add, update, and delete tasks associated with projects.
- **Milestone Tracking**: Set and track progress on major project milestones.
- **Collaboration**: Assign tasks to team members and monitor their contributions.
- **Progress Reports**: Generate detailed reports on project progress and performance.
- **Notifications**: Stay informed with reminders for upcoming deadlines and updates.

### Technologies Used:

- **Frontend**: Flutter
- **Backend**: Node.js (Express.js framework)
- **Database**: PostgreSQL
- **Version Control**: Git and GitHub

## Installation

Follow these steps to set up the project locally:

1. **Clone the repository**:

   ```bash
   git clone https://github.com/codewithpoojasri/project_tracker.git
   cd project_tracker
   ```

2. **Install dependencies**:

   - For the backend:
     ```bash
     cd backend
     npm install
     ```
   - For the frontend:
     ```bash
     cd frontend
     flutter pub get
     ```

3. **Set up the database**:

   - Install PostgreSQL and create a database.
   - Run the migration scripts (located in `backend/migrations`) to set up the database schema.

4. **Start the development server**:

   - Backend:
     ```bash
     npm start
     ```
   - Frontend:
     ```bash
     flutter run
     ```

5. **Access the application**:
   Open your browser and go to `http://localhost:3000` to access the backend API or use an emulator/device for the Flutter frontend.

## Usage

1. Create a new project.
2. Add tasks and assign them to team members.
3. Monitor progress through the dashboard.
4. Generate reports to review overall performance.

## Contributing

Contributions are welcome! Follow these steps to contribute:

1. Fork the repository.
2. Create a new branch for your feature/fix.
3. Commit your changes and push them to your fork.
4. Open a pull request to the main repository.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
