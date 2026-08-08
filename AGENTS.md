# AGENTS.md

# Receipt Generator & Printing App — Development Agent Instructions

## Objective

Your task is to implement the application logic for the Receipt Generator & Printing App.

**The UI, layouts, navigation, and screen designs are already complete and must not be redesigned.**

Your responsibility is to connect the existing UI with business logic, local state management, Firebase services, receipt generation, and printing functionality.

Work incrementally and complete one phase before moving to the next. Do not begin a later phase until the current phase is fully implemented, tested, and stable.

---

# General Rules

## UI

* Do not redesign any screen.
* Do not change the application's navigation.
* Do not modify colors, typography, spacing, icons, or layout.
* Only connect the existing widgets to application logic.

---

## Code Quality

Follow Flutter best practices.

Requirements:

* Clean Architecture (lightweight)
* Feature-first folder organization
* Small reusable services
* Strong typing
* Null safety
* Proper error handling
* Avoid duplicated logic
* Keep widgets lightweight
* Separate UI from business logic

---

## State Management

Use Provider.

Avoid placing business logic inside widgets.

Create dedicated providers/services for:

* ReceiptProvider
* PrinterProvider
* FirestoreService
* PdfService

---

## Firebase

Use:

* firebase_core
* cloud_firestore
* firebase Authentication

There will be one Firestore database.

---

## Data Model

Create a Receipt model.

Suggested fields:

* id
* voucherNumber
* mineralType
* mineralValue
* quantity
* vehicleNumber
* transportPhone
* buyerName
* destination
* productionCenter
* sellerName
* licenseNumber
* salesDate
* qrData
* createdAt
* updatedAt

Provide:

* fromMap()
* toMap()
* copyWith()

---

# PHASE 1 — Project Foundation

Goal

Prepare the application architecture.

Tasks

* Configure Firebase.
* Create models.
* Create services.
* Create providers.
* Configure dependency injection if needed.
* Create shared constants.
* Configure date formatting.
* Configure application-wide error handling.

Do not implement receipt logic yet.

Completion Criteria

Project compiles successfully.

---

# PHASE 2 — Receipt Form Logic

Goal

Connect all input fields.

Implement:

* Text controllers
* Form validation
* Required field validation
* Numeric validation
* Phone validation
* Read-only constant fields
* Current date/time generation
* Voucher number prefix handling (always begins with "A437")
* Mineral value prefix handling (always begins with "TZS")

The user should only enter the editable portion of prefixed fields.

Completion Criteria

The form validates correctly and produces a complete Receipt object.

---

# PHASE 3 — Receipt Preview & Verification

Goal

Implement receipt preview.

Requirements

Pressing "Generate Receipt" must NOT print immediately.

Workflow:

Create Receipt

↓

Generate Receipt object

↓

Open Preview

↓

Display all entered values

↓

Ask:

"Are all the details correct?"

Only after confirmation may printing proceed.

Completion Criteria

Printing is blocked until confirmation.

---

# PHASE 4 — Firestore Integration

Goal

Store receipts.

Create:

Firestore collection:

receipts

Implement:

Create receipt

Read receipts

Update receipt

Delete receipt

Sort by newest first.

Store timestamps using server timestamps where appropriate.

Completion Criteria

CRUD operations work correctly.

---

# PHASE 5 — Receipt History

Goal

Connect the existing Receipt History UI.

Implement:

* Load all receipts
* Search
* Sorting
* Pull-to-refresh
* Empty state handling
* Loading state
* Error handling

Search should support:

* Voucher Number
* Buyer Name
* Vehicle Number

Completion Criteria

History screen fully functional.

---

# PHASE 6 — Receipt Details

Goal

Connect the detail screen.

Display all stored information.

Buttons:

* Edit
* Delete
* Print

Deletion requires confirmation.

Completion Criteria

Receipt detail screen fully operational.

---

# PHASE 7 — Editing Receipts

Goal

Allow editing.

Load Firestore data into the existing form.

Implement:

* Update receipt
* Save changes
* Refresh history
* Refresh detail screen

Completion Criteria

Editing works without creating duplicate receipts.

---

# PHASE 8 — QR Code Generation

Goal

Generate QR codes.

Use an appropriate Flutter package.

The QR code should encode either:

* Receipt ID (preferred)
* Voucher Number

Display the QR code:

* Preview screen
* Printed receipt

Completion Criteria

Every receipt has a valid QR code.

---

# PHASE 9 — PDF Generation

Goal

Generate printable receipts.

Use:

pdf

Create:

PdfService

The PDF must mirror the existing receipt design exactly.

Include:

Business information

Receipt information

Mineral information

QR code

Footer

Completion Criteria

PDF generation matches the designed receipt layout.

---

# PHASE 10 — Printer Integration

Goal

Support receipt printers.

Use suitable Flutter packages for:

Bluetooth printers

Wi-Fi printers

Implement:

Printer discovery

Printer selection

Connection

Automatic reconnection

Test print

Actual receipt printing

Store the selected printer locally so it reconnects automatically when possible.

Completion Criteria

Users can print receipts with one action after confirmation.

---

# PHASE 11 — Local Preferences

Use SharedPreferences.

Store:

* Selected printer
* Printer type
* Last printer IP
* Last Bluetooth device
* Application preferences

Do not store receipt data locally.

Firestore remains the source of truth.

---

# PHASE 12 — Error Handling

Handle gracefully:

No internet

Firestore unavailable

Printer disconnected

Bluetooth disabled

Wi-Fi unavailable

PDF generation failures

Printing failures

Display clear, user-friendly error messages.

---

# PHASE 13 — Performance Optimization

Optimize:

Firestore reads

Firestore writes

Widget rebuilds

Provider listeners

Memory usage

Large receipt history

Avoid unnecessary rebuilds.

---

# PHASE 14 — Testing

Verify:

Receipt creation

Receipt editing

Receipt deletion

Receipt history

Search

Firestore synchronization

QR generation

PDF generation

Printer connection

Printing

App restart

Offline behavior

No crashes

---

# Firestore Structure

Collection

receipts

Each document should contain:

* voucherNumber
* mineralType
* mineralValue
* quantity
* vehicleNumber
* transportPhone
* buyerName
* destination
* productionCenter
* sellerName
* licenseNumber
* salesDate
* qrData
* createdAt
* updatedAt

---

# Flutter Packages

Use only well-maintained packages.

Core packages include:

* firebase_core
* cloud_firestore
* provider
* intl
* uuid
* pdf
* printing
* qr_flutter
* shared_preferences

For printing, choose stable packages that support both Bluetooth and network (Wi-Fi) thermal receipt printers.

Avoid adding unnecessary dependencies.

---

# Development Workflow

Every phase must follow this sequence:

1. Implement the feature.
2. Resolve all compilation issues.
3. Test the feature thoroughly.
4. Remove dead or unused code.
5. Refactor if necessary.
6. Ensure existing functionality is not broken.
7. Commit the phase before starting the next.

Never skip phases.

---

# Definition of Done

A phase is complete only when:

* The project builds successfully.
* No analyzer errors remain.
* No runtime exceptions occur during normal use.
* Existing functionality continues to work.
* The feature has been manually tested.
* Code follows Flutter best practices.

Do not continue to the next phase until all of these conditions are satisfied.

---

# Final Goal

The completed application should provide a seamless workflow:

1. User creates a new receipt.
2. The app validates all inputs.
3. A receipt preview is generated.
4. The user confirms the details.
5. The receipt is saved to Firestore.
6. A QR code is generated and embedded.
7. A printable PDF is created.
8. The receipt is printed to the selected printer.
9. The receipt appears immediately in Receipt History.
10. Users can later search, view, edit, delete, or reprint any saved receipt.

Maintain clean, modular, production-quality code throughout the implementation. Focus on reliability, maintainability, and minimal disruption to the existing UI while implementing each phase.
