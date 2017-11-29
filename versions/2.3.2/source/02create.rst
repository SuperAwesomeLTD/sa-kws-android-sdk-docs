Creating a new user
===================

You can create a new one by calling:

.. code-block:: java

  KWSChildren.sdk.createUser(MainActivity.thos,
                             "username",
                             "password",
                             "2011-03-02",
                             "US",
                             "parent@test.com",
                             new KWSChildrenCreateUserInterface ()
  {
    @Override
    public void didCreateUser (KWSChildrenCreateUserStatus status) {

      switch (status) {
        case Success:
          // create new user OK
          break;
        case DuplicateUsername:
          // another user has the same username
          break;
        case NetworkError:
          // other network error
          break;
      }
    }
  });

The callback will pass the following values on completion:

======= =========================== ======
Value   Type                        Meaning
======= =========================== ======
status  KWSChildrenCreateUserStatus End status of the operation
======= =========================== ======

The **status** parameter may have the following values:

================== ======
Value              Meaning
================== ======
Success            User was authenticated successfully
InvalidUsername    Chosen username contains invalid characters
InvalidPassword    Password is less than 8 characters
InvalidDateOfBirth Date should have YYYY-MM-DD format
InvalidCountry     Country should have CC format
InvalidParentEmail Parent email is invalid
DuplicateUsername  The username is already in use
NetworkError       Other network error
InvalidOperation   Other invalid operation
================== ======

From here on you'll be able to check leaderboards, assign points, enable remote notifications, set app data, etc.
