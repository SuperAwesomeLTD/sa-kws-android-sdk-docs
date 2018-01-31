Creating and authenticating a user
==================================

KWS brandable view
^^^^^^^^^^^^^^^^^^

To be able to authenticate or create a user through a KWS brandable view you must follow the next steps:

Enable Implicit Flow in the Control Panel
-----------------------------------------

The first step is to enable Implicit Flow in your Kids Web Services Control Panel.

- Head over to the **Integration** section of your app
- Under the **User Authentication (Single Sign On)** section enable **Implicit Flow**

.. image:: img/oauth_1.png

.. note:: Please take a note of the **SSO (Single Sign On) URL** because you will need it later.

Add OAuth redirect URLs
-----------------------

The second step, once you've enabled Implicit Flow, is to add **OAuth Redirect URLs** to the Control Panel.

.. image:: img/oauth_2.png

Where **com.example.my.android.app** is the Package name of your Android app, as defined in your Manifest file.

Modify you Manifest file
------------------------

The third step is to add a new Activity in your Android Manifest file:

.. code-block:: xml

    <activity
      android:name="kws.superawesome.tv.kwssdk.base.webauth.KWSWebAuthResponse"
      android:exported="true"
      android:launchMode="singleTask">
        <intent-filter>
          <action android:name="android.intent.action.VIEW" />
          <category android:name="android.intent.category.DEFAULT" />
          <category android:name="android.intent.category.BROWSABLE" />
          <data android:scheme="__YOUR_PACKAGE_NAME__"/>
        </intent-filter>
    </activity>

This will allow your Android app to receive and parse the response back from the authentication process.

.. note:: Please note that __YOUR_PACKAGE_NAME__ must be replaced with your actual Android application Package Name, the same one you added in the Kids Web Services Control Panel earlier on. In our case it would be **com.example.my.android.app**

Call authentication method
--------------------------

Finally, once the prerequisite steps have been completed you can call the SDK method that will initialise the authentication process.

To do so we'll use the **SSO (Single Sign On) URL** obtained from the Kids Web Services Control Panel earlier on.

For our example, that should be something like **https://my.cluster.accounts.kws.superawesome.tv/**.

.. code-block:: java

    // this function takes the SSO URL as the first parameter
    // and an Activity instance as the second parameter
    // as well as a callback listener as the third parameter
    KWSChildren.sdk.authUser("https://my.cluster.accounts.kws.superawesome.tv/",
                             this,
                             new KWSChildrenLoginUserInterface()
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

Native view
^^^^^^^^^^^

To be able to authenticate and create a user using your own native views, you can use the following methods:

Creating a user
---------------

You can also create a new user programmatically by calling:

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

Obtaining a random display name
-------------------------------

Sometimes it's a good idea to preemptively suggest a display name to users who want to create a new account.
Whether you want to ensure display names are valid, safe and non-duplicate or you wish to align names with the
in game universe you have created, KWS can help you by providing a method to generate random display names.

In order for KWS to properly generate then you'll first have to add possible values in your KWS dashboard:

.. image:: img/randomnames.png

Once that's done, it's a simple as calling:

.. code-block:: objective-c

  KWSChildren.sdk.getRandomUsername (MainActivity.this,
                                     new KWSChildrenGetRandomUsernameInterface ()
  {
    @Override
    public void didGetRandomUsername (String name) {
      // if the name parameter is null, no name could be generated or
      // KWS is down;
      // Otherwise it will return a valid, unique name based on the values
      // you entered in the dashboard
    }
  });

Login user
----------

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
