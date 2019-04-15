## Synchronoss Coding Challenge

<img src="https://raw.githubusercontent.com/afnanm1999/synchronoss-coding-challenge/master/logo/SynchronossCodingChallengeIcon/ios/iTunesArtwork%403x.png" width="250">

### Screenshots

<img src="https://raw.githubusercontent.com/afnanm1999/synchronoss-coding-challenge/master/Screenshots/img1.png" width="250"> <img src="https://raw.githubusercontent.com/afnanm1999/synchronoss-coding-challenge/master/Screenshots/img2.png" width="250"> <img src="https://raw.githubusercontent.com/afnanm1999/synchronoss-coding-challenge/master/Screenshots/Simulator%20Screen%20Shot%20-%20iPhone%20Xs%20-%202019-04-15%20at%2000.58.04.png" width="250">

### Features

- Created a Custom Launch Screen Logo for the application.
- Card View with Shadows
- In the Details View Added These Details:
    - Train Arrival Time
    - Train Departure Time
    - Train Expected Departure
    - Train Origin
    - Train Type
    - Train Directions
    - Train Status
    - Train Destination
    - MapView with Stations Location pinpointed
  
### How to Use the app

In order to test the app, project files need to be opened in Xcode 10.2<br/>
There is no need to configure anything inside of the application source code. The project is already configured and can be run directly on a simulator of your choice. when the app first launches it will fetch the Station's Data from the Irish Rail API. Once the data has been fetched successfully it will then list two Stations in a UITableView. The name of these stations Should be "Rathdrum" & "Dalkey". Users can simply go ahead and click on a station of their choice. This action will present a Detail View Controller with the Selected Stations Details.

### Challenge

From Monday to Friday, I travel by train from Rathdrum to Dalkey in the morning and return in the evening.

Build a mobile app that will be useful for me using the Irish Rail Realtime API: http://api.irishrail.ie/realtime/

You can make use of any additional libraries, or services.

Aim to spend a maximum of 5 hours on this so focus on core functionality first (networking, parsing, UI integration). This is an open-ended test so feel free to modify, or interpret, the requirements as you see fit.

We will discuss this on a follow-up call, or face to face interview, so a partial solution is acceptable as long as it demonstrates the core functionality described above.
