# future instructions

* add the android app icons in android/app/src

* Verify each finding against current code. Fix only still-valid issues,
  skip the rest with a brief reason, keep changes minimal, and validate.

  In @receiptapp/lib/screens/create_receipt_screen.dart around lines 313 -
  318, Replace the hardcoded sales timestamp in the create receipt screen’s
  Sales Date & Time _buildInfoCard with the receipt draft’s creation
  timestamp from the existing receipt data or creation flow. Capture the
  timestamp when the draft is created if no source value exists, then format
  it for display while preserving the card’s current label and icon.

* Verify each finding against current code. Fix only still-valid issues,
  skip the rest with a brief reason, keep changes minimal, and validate.

  In @receiptapp/lib/screens/create_receipt_screen.dart around lines 324 -
  345, Update the Preview Receipt button’s onPressed callback in the create
  receipt screen to validate all required form fields, then invoke the
  existing preview route or callback with the completed receipt data; if no
  preview destination is available, remove the button rather than leaving a
  no-op callback.

*  Verify each finding against current code. Fix only still-valid issues,
 skip the rest with a brief reason, keep changes minimal, and validate.

 In @receiptapp/lib/screens/create_receipt_screen.dart around lines 58 -
 61, Update the navigation handling in the create receipt screen so menu
 and bottom-navigation actions are forwarded to MainWrapper instead of
 being handled locally. Remove the separate _currentNavIndex state and
 obtain the selected index from MainWrapper, ensuring navigation changes
 are applied by the owner while this screen remains visible.
