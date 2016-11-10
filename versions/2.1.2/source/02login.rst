Login as a user
===============

To login as a user you'll have to call:

.. code-block:: java

  KWS.sdk.loginUser (MainActivity,
                     "username",
                     "password",
                     new KWSAuthUserProcessInterface ()
  {
    @Override
    public void userAuthenticated(KWSAuthUserStatus status) {

      switch (status) {
        case Success:
          // authenticated OK
          break;
        case NetworkError:
          // one of the credentials was not valid
          break;
        case InvalidCredentials:
          // there was a network error
          break;
      }
    }
  });

The callback will pass the following values on completion:

====== ================= ======
Value  Type              Meaning
====== ================= ======
status KWSAuthUserStatus End status of the operation
====== ================= ======

The **status** parameter may have the following values:

================== ======
Value              Meaning
================== ======
Success            User was authenticated successfully
InvalidCredentials The username or password were incorrect
NetworkError       Other network error
================== ======

From here on you'll be able to check leaderboards, assign points, enable remote notifications, set app data, etc.
