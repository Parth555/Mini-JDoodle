Project Documentation

JDoodle Mini-Replica Mobile App
Table of Contents
Project Overview

Architecture & Technologies Used

Challenges Faced & Solutions Implemented

Implementing Monaco Editor in Flutter

Integrating JDoodle WebSocket API in Flutter

Managing User Sessions

Saving Program History

Code Structure

State Management with BLoC

UI/UX Design Considerations

Conclusion

Future Enhancements

1. Project Overview
This mobile app is designed to function as a mini-replica of JDoodle's mobile app, allowing users to compile and run programs from their devices. It utilizes JDoodle's WebSocket API in interactive mode and stores user programs locally. Additionally, the app tracks user activity, including the number of programs run and time spent on each programming language.

The main features of the app include:

Integration of Monaco editor for code input

Execution of code via JDoodle WebSocket API

Session persistence using Shared Preferences

Program history storage using ObjectBox

User activity statistics

Intuitive and responsive user interface

2. Architecture & Technologies Used
The app is built using Flutter, with the following core technologies and libraries:

Monaco Editor for a robust and flexible code editor experience.

JDoodle WebSocket API for real-time code execution.

Shared Preferences for session management to restore user’s state.

ObjectBox for managing the history of programs executed by the user.

BLoC (Business Logic Component) for state management, ensuring a clean separation between business logic and UI.

3. Challenges Faced & Solutions Implemented
3.1 Implementing Monaco Editor in Flutter
Challenge: Monaco editor does not have a direct implementation package in Flutter, and the available Flutter packages didn’t support it.

Solution: I opted to integrate the Monaco editor using a JavaScript code injection approach. I created a WebView and loaded the Monaco editor via JavaScript inside the WebView. This allowed me to embed the editor seamlessly within the app.

Steps followed:

Created a WebView in Flutter.

Injected JavaScript code to load Monaco Editor in the WebView.

Established communication between Dart and the JavaScript side for getting the code input from the editor.

3.2 Integrating JDoodle WebSocket API in Flutter
Challenge: While trying to implement JDoodle's WebSocket API using Dart’s dart:io WebSocket library, the connection failed. I also tried using the web_socket_channel package but faced similar issues.

Solution: After extensive research, I found that JDoodle’s WebSocket API can be accessed using JavaScript. I created a JavaScript file to handle the WebSocket API calls and interacted with the Dart code via WebView. This allowed me to successfully send and receive data between the JDoodle WebSocket API and the Monaco editor.

Steps followed:

Created a JavaScript file to handle WebSocket API calls.

Used WebView in Flutter to execute this JavaScript code.

Established communication between Dart and JavaScript for sending input to the WebSocket API and retrieving results.

3.3 Managing User Sessions
Challenge: The app needed to save the user’s current state (editor contents, selected programming language) when closed and restore it when reopened.

Solution: I used Shared Preferences to store the user's session data locally. This approach ensures that when the app is reopened, the user can resume from where they left off.

Steps followed:

Stored the user's current code, language, and any unsent commands using Shared Preferences.

On app launch, retrieved and restored the saved session data.

3.4 Saving Program History
Challenge: The app needed to store a history of executed programs and retrieve it for later use.

Solution: I used ObjectBox, a high-performance Flutter database, to save the user's program history locally. This allowed efficient storage and retrieval of the executed programs and associated metadata.

Steps followed:

Defined a data model for program history.

Implemented ObjectBox to store the executed programs and retrieve them for the history view.

Allowed users to view and rerun past programs.

4. Code Structure
The app uses BLoC (Business Logic Component) for managing the state efficiently. This ensures a clear separation of concerns between business logic and UI. Each component in the app is built with reusability and scalability in mind.

Key Components:
EditorBloc: Manages the state of the Monaco editor, including loading the saved code and reacting to changes.

WebSocketBloc: Handles the connection and data exchange with the JDoodle WebSocket API.

SessionBloc: Manages session restoration and persistence using Shared Preferences.

HistoryBloc: Handles the saving and retrieval of executed program history using ObjectBox.

5. UI/UX Design Considerations
The app is designed with user experience at the forefront. Key design principles included:

Clean, minimal interface: The Monaco editor is central to the UI, with simple controls for running code and switching languages.

Responsive design: The app is optimized for a range of device sizes, ensuring it remains user-friendly on both phones and tablets.

Seamless interaction: Users can easily switch between languages, access their program history, and manage their session without disruptions.

Performance: WebView performance was optimized for loading Monaco editor and JDoodle WebSocket communication without noticeable lag.

6. Conclusion
This app provides a seamless platform for running and compiling code on mobile devices by integrating JDoodle's WebSocket API and Monaco Editor. Despite the challenges faced during development, including integrating third-party components and establishing WebSocket connections in Flutter, the app successfully achieves its intended functionality with a clean, user-friendly interface.

7. Future Enhancements
Future features that could improve the app further include:

Non-interactive mode: Adding JDoodle’s REST API support for non-interactive code execution.

Cloud sync: Enabling users to sync their program history across multiple devices.

Advanced language statistics: Providing more granular statistics, such as average execution time and language proficiency.

Theme customization: Allowing users to change the editor theme or layout.

This document covers all the critical aspects of the development process, including challenges faced and how they were overcome. If you need further refinements or additional sections, feel free to ask!
