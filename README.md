# Community Resource Assessment

A Flutter application that collects patient information and comprehensive social determinants of health (SDOH) data.

## About This Project

### What are Social Determinants of Health (SDOH)?

Social Determinants of Health are the non-medical factors that influence health outcomes. These are the conditions in which people are born, grow, work, live, and age, and the wider set of forces and systems shaping the conditions of daily life.

This app implements a way to collect basic patient information as well as prompt the user to complete an example SDOH form. Additionally, this app provides a simple date model for building these questionnaires and could easily be leveraged to build more forms out if necessary.

## Use of AI in Development

I did use AI tooling for help with this application - specifically, I used Claude code.

### Specific examples
I started with seeing how well it could scaffold the application for me. This didn't prove quite as useful as I had hoped, and I had to rework a fair bit of the code it generated (Namely - it tried to do too much, and it didn't work)

Most often I would simply prompt it to guide me how to implement a specific feature I wanted to add and analyze the code it produced. This is the first time I have used any of these tools (Dart, flutter, firebase, etc), so it was quite useful for speed of development, but I often found myself cross-referencing what it produced with the google docs to better understand what was actually going on.

## Features Implemented

- Example SDOH screening questionnaire
- Dynamic Questionnaire Data Model
- Patient information collection (name, DOB, contact details)
- Firebase Firestore integration for patient data persistence
- Form validation and error handling
- Success page confirmation

## Features / Items Not Implemented

**Testing**

In a perfect world, I would have written tests for my code. I have intentionally left this out due to time and my unfamiliarity with the tools. Potential test scenarios include:   
- patient info form validation
- dynamic questionnaire form building (radio Question vs checkbox Question, conditional description text)
- patient info data submission

**Questionaire Form Submission / Form Validation**

Due to time constraints, we simply log the patients selection to the questionnaire instead of saving this to a database. Also there are no constraints around completing this form (such as requiring all questions to be filled out, or incorporating such logic into the data model)

**Authentication / Authorization**

Again, due to time constraints, this was left out but could definitely be added in.

## Potential Enhancements
Aside from the notable items left out above, one could make some additional liberties to provide better care for patients / ease of use, such examples could include

- A way for providers to import questionnaires, or build their own questionnaires
- assign values within the questionnaire to better assess risk for each SDOH category (example: if the patient scores higher than X in a specific category, this may indicate to the provider that certain action should be taken as a follow up)


## Getting Started

### Prerequisites
- Flutter SDK
- Firebase project with Firestore enabled
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
```bash
git clone https://github.com/stephen-hartshorne/firebase-flutter-kata.git
cd firebase-flutter-kata
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure Firebase:
   - Create a new Firebase project
   - Enable Firestore Database
   - Download configuration files and place them in the appropriate platform directories

4. Run the application:
```bash
flutter run
```

## Project Structure

```
lib/
├── core/
│   ├── questionnaires/
│   │   └── cms.dart                    # CMS screening questionnaire data
│   └── services/
│       └── patient_info_service.dart   # Firebase data persistence
├── features/
│   ├── home/
│   │   └── pages/
│   │       └── home_page.dart          # Welcome screen
│   ├── patient_info/
│   │   └── pages/
│   │       └── patient_info.dart       # Patient information form
│   ├── questionnaire/
│   │   └── pages/
│   │       └── questionnaire_page.dart # SDOH screening form
│   └── success/
│       └── pages/
│           └── success_page.dart       # Success page
├── shared/
│   ├── models/
│   │   ├── answer_state.dart           # Response state management
│   │   ├── question.dart               # Question data model
│   │   └── section.dart                # Questionnaire section model
│   └── widgets/
│       ├── patient_info_form.dart      # Reusable patient form widget
│       └── questionnaire_form.dart     # Reusable questionnaire widget
└── main.dart                           # Application entry point
```