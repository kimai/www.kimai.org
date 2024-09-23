
| Permission Name               | Description                                                                                                    |
|-------------------------------|----------------------------------------------------------------------------------------------------------------|
| **User**                      |                                                                                                                |
| create_user                   | Create new users                                                                                               |
| delete_user                   | **SECURITY ALERT**: Delete existing users                                                                      |
| view_user                     | Access the User administration and see the list of all users - `System-Admins` will always own that permission |
| **User profile (other)**      |                                                                                                                |
| api-token_other_profile       | Change the API token for other users                                                                           |
| edit_other_profile            | **SECURITY ALERT**: edit the profile for another user                                                          |
| hourly-rate_other_profile     | Edit other (users specific) hourly rate                                                                        |
| password_other_profile        | Change the password for another user                                                                           |
| preferences_other_profile     | Change the preferences for another user                                                                        |
| roles_other_profile           | **SECURITY ALERT**: change roles for other users                                                               |
| supervisor_other_profile      | Change the supervisor for the selected profile                                                                 |
| teams_other_profile           | Edit team assignments in other user profile                                                                    |
| view_other_profile            | View other user profiles                                                                                       |
| **User profile (own)**        |                                                                                                                |
| api-token_own_profile         | Change the own API token                                                                                       |
| edit_own_profile              | Edit own user profile/account                                                                                  |
| hourly-rate_own_profile       | Edit the own (user specific) hourly rate                                                                       |
| password_own_profile          | Change own password (should be deactivated when [LDAP]({% link _documentation/ldap.md %}) is used)             |
| preferences_own_profile       | Allows a user to edit the own preferences                                                                      |
| roles_own_profile             | **SECURITY ALERT**: change the own user roles                                                                  |
| supervisor_own_profile        | Change the supervisor for the own profile                                                                      |
| teams_own_profile             | Edit team assignments in own user profile                                                                      |
| view_own_profile              | View own user profile and statistics                                                                           |
{: .table .permissions }
