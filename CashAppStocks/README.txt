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



