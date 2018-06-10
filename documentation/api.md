---
layout: kimai
title: Documentation for Kimai
description: Documentation for Kimai Time-Tracking
---
# Kimai Remote Api

This part of the documentation is dedicated for developers who want to make 3rd party applications that use kimai as Kimai as a backend. The current version contain two available ways to access the api :
 - JSON service based on json-rpc 2.0
Available at [/core/json.php](https://github.com/kimai/kimai/blob/master/core/json.php), by requesting the page without passing parameter you will get the full list of available methods.
 - SOAP (Simple Object Access Protocol)
Available at [/core/soap.php](https://github.com/kimai/kimai/blob/master/core/soap.php), by adding the parameter wsdl /core/soap.php?wsdl you can get the definition for the service that you can consume using a soap client.

For more details about how the services works :
 -Json: https://framework.zend.com/manual/1.12/en/zend.json.server.html
 -Soap:https://framework.zend.com/manual/1.12/en/zend.soap.server.html

Beside the interfaces for the api, you can find the base file for api at [/libraries/Kimai/Remote/Api.php](https://github.com/kimai/kimai/blob/master/libraries/Kimai/Remote/Api.php), that's where all api methods are defined.


## JSON API

The simple to consume the api is through the json api, depending on what programing language you're using and what platform you're targetting you might find a json-rpc already written that you can use to access this api.

Otherwise you can still format your calls using a simple httprequest, let's take the example of the authenticate method that is required when you first initiate communication with the api, the authenticate method return a called ApiKey that will be used for any other api call.

Basicly what you really need to know is that any method needs an array of parameters called "params" and returns an array of results called "items" on success, and "error" on failing. 

In our authentication senario we will provide "params" containing ["user_login","user_password"] and on success we would get "items" containg [{"apiKey":"123...ab"}]

Here is the example of this call using C#



```csharp
HttpClient client = new HttpClient();
string jsonString="{\"method\":\"authenticate\", \"jsonrpc\":\"2.0\",\"id\":\"1\",\"params\":[\"my_login\",\"my_password\"]}";
var response = await client.PostAsync("http://example.com/core/json.php", new StringContent(req_obj.ToString(), Encoding.UTF8, "application/json"));
string url="http://example.com/core/json.php";
StringContent sc= new StringContent(jsonString, Encoding.UTF8, "application/json")
var response = await client.PostAsync(url, sc);
string result = await response.Content.ReadAsStringAsync();
```

Request :

```json
{
  "method": "authenticate",
  "params": [
    "user_login",
    "user_password"
  ],
  "id": "1",
  "jsonrpc": "2.0"
}

```

Response:
 - On success:

```json
{  
   "result":{  
      "success":true,
      "items":[{"apiKey":"a99......2ce110c"}],
      "total":1
   },
   "id":"1",
   "jsonrpc":"2.0"
}
```
 - On fail:
 ```json
{  
   "result":{  
      "success":false,
      "error":{"msg":"Unknown user or no permissions."}
   },
   "id":"1",
   "jsonrpc":"2.0"
}
```


## SOAP API
...

## API Methods 

Here is the full list of all available methods on the current API:

 - authenticate :
Authenticates a user and returns the API key. The result is either an empty string (not allowed or need to login first via web-interface) or a string with max 30 character, representing the users API key.
 -getVersion :
Returns the current version & revision of kimai, useful for e.g. having version dependant features
 -startRecord :
The user started the recording of an activity via the buzzer. If this method is called while another recording is running the first one will be stopped. If $projectId and $activityId are empty the last activity will be restarted.
 -stopRecord :
Stops the currently running recording. If $entryId is empty the current activity will be stopped.
 -getUsers :
Return a list of users. Customers are not shown any users. The type of the current user decides which users are shown to him. Returns false if the call could not be executed, null if no users could be found or an array of users.
 -getCustomers :
Return a list of customers. A customer can only see himself.
 -getProjects :
Return a list of projects. Customers are only shown their projects.
 -getTasks :
Return a list of tasks. Customers are only shown tasks which are used for them. If a project is set as filter via the project parameter only tasks for that project are shown.
 -getActiveRecording :
Returns an array with values of the currently active recording.
 -updateActiveRecording :
updateActiveRecording Updates an already running timer, this function allows you to change a project, activity description, comment and start time. If you add an end time this will stop the activity, as per Kimai's normal process Note: you can edit a recording if timeEntryID defined in parameters
 -getTimesheet :Returns a list of recorded times.
 -getTimesheetRecord :@param string $apiKey
 -setTimesheetRecord :@param string $apiKey
 -removeTimesheetRecord :@param string $apiKey
 -getExpenses :Returns a list of expenses.
 -getExpenseRecord :@param string $apiKey
 -setExpenseRecord :@param string $apiKey
 -removeExpenseRecord :@param string $apiKey
