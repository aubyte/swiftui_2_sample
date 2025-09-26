# swiftui_2_sample
iOS/macOS SwiftUI demonstration project for job application purposes.

<img width="1196" height="1640" alt="Screenshot 2025-09-26 at 7 32 48 PM" src="https://github.com/user-attachments/assets/84c28ddb-17db-476b-a5a3-8a07708ed95a" />


# A bare bones basic SwiftUI app to demonstrate async loading/rendering of RESTful data.


1. Organization
---------------

The project loosely follows MVC pattern, with modules split into the following groups:

 - DATA, definitions of structures and lower level API calls. Defines portfolio data, implements production and test API.

 - MODEL, mid-level modules that bridge data with views. These have bindings for views to receive async updates about data changes, access data, and for configuration view to store config info.

 - VIEW, user interfaces to visualize components of data, and has full composition views.



2. Running the Project
----------------------

It is a multiplatform app, but it was tested only on macOS. Build and run, it will present a single view with "Configuration" and "Fetch Portfolio" buttons.

 - "Configuration" expands a small panel with options to enable auto refresh of endpoint calls, and a segmented control to select endpoint type: "Normal", "Malformed", "Empty".

 - "Fetch Portfolio" makes async call to fetch data from the selected endpoint.

If fetch is successful, the lower part of the view will show a list of stocks. Each stock shows all available properties. An empty list will show "EMPTY" instead.

If there is an error during fetch, the text below the button will show relevant error message.



3. Test Cases
-------------

There are test cases in a CashAppStockTests group. They test against an offline test data.



