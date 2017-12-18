Login user programmatically
===========================

To login as a user programmatically you'll have to call:

.. code-block:: java

  KWSChildren.sdk.loginUser (MainActivity.this,
                             "username",
                             "password",
                             new KWSChildrenLoginUserInterface ()
  {
    @Override
    public void didLoginUser (KWSChildrenLoginUserStatus status) {

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

====== ========================== ======
Value  Type                       Meaning
====== ========================== ======
status KWSChildrenLoginUserStatus End status of the operation
====== ========================== ======

The **status** parameter may have the following values:

================== ======
Value              Meaning
================== ======
Success            User was authenticated successfully
InvalidCredentials The username or password were incorrect
NetworkError       Other network error
================== ======

From here on you'll be able to check leaderboards, assign points, enable remote notifications, set app data, etc.
