Notifications
=============

Assuming the Firebase service is correctly setup you can then handle Remote Notifications for the user you're authenticated as.

This includes trying to register or unregister for Remote Notifications as well as checking if the user is already registered.

Thus the SDK will handle enabling them on the user's devices as well as enabling them in the KWS back-end.
The SDK will also handle requesting parental permission and making sure that if they don't allow the user to receive notifications anymore, no more
notifications will be sent to his device.

Register
^^^^^^^^

You can start registering for Remote Notifications by calling:

.. code-block:: java

  // declare a new Callback of type "registered"
  RegisterInterface callback = new RegisterInterface () {
    @Override
    public void register (KWSNotificationStatus status) {

    }
  })

  // use that callback as parameter for the SDK register method
  KWS.sdk.register (MainActivity.this, calback);

The callback will pass the following values on completion:

====== ===================== ======
Value  Type                  Meaning
====== ===================== ======
status KWSNotificationStatus End status of the operation
====== ===================== ======

The **status** parameter may have the following values:

+-------------------------------------------------+
| **Status**                                      |
+-------------------------------------------------+
| Success                                         |
+-------------------------------------------------+
| ParentDisabledNotifications                     |
+-------------------------------------------------+
| UserDisabledNotifications                       |
+-------------------------------------------------+
| NoParentEmail                                   |
+-------------------------------------------------+
| FirebaseNotSetup                                |
+-------------------------------------------------+
| FirebaseCouldNotGetToken                        |
+-------------------------------------------------+
| NetworkError                                    |
+-------------------------------------------------+

If the parent or user have disabled Remote Notifications then the Kids Web Services SDK will acknowledge this and not continue further.
In this scenario it is advised to explain to the user why your app needs Remote Notifications.

If the user doesn't have an associated Parent Email you can use the **submitParentEmail:** method to submit an email, as explained previously.

If Firebase is setup incorrectly then you might want to check your current setup to make sure all settings are correct.

**NetworkError** indicate an underlining network error. It's then safe to subscribe for Remote Notifications at a later time.

A good example of handling different scenarios would be the following:

.. code-block:: java

  final RegisterInterface callback = new RegisterInterface () {
    @Override
    public void register (KWSNotificationStatus status) {

      switch (status) {
        case Success: {
          // handle success
          break;
        }

        // user had disabled remote notifications
        case UserDisabledNotifications: {
          // tell the user why your app needs notifications
          // guide him to the settings page
          break;
        }

        // user has no parent email submitted
        case NoParentEmail: {

          KWS.sdk.submitParentEmailWithPopup (MainActivity.this, new KWSParentEmailInterface() {
            @Override
            public void submitted (KWSParentEmailStatus emailStatus) {
              switch (emailStatus) {
                case Success:
                  KWS.sdk.register (MainActivity.this, callback);
                  break;
              }
            }
          });

          break;
        }

        default:break;
      }
    }
  };

  // try to register for remote notifications
  KWS.sdk.register (MainActivity.this, callback);

Unregister
^^^^^^^^^^

Reversely, you can unregister the user you're authenticated as by calling:

.. code-block:: java

  KWS.sdk.unregister (MainActivity.this, new UnregisterInterface() {
    @Override
    public void unregister (boolean unregistered) {
      // hand unregister
    }
  });

The callback will pass the following value on completion:

======= ==== ======
Value   Type Meaning
======= ==== ======
success Bool whether the SDK could unregister for notifications
======= ==== ======

Verify
^^^^^^

Finally, you can check if the user you're authenticated as is already registered by calling:

.. code-block:: java

  KWS.sdk.isRegistered (MainActivity.this, new IsRegisteredInterface() {
    @Override
    public void isRegistered (boolean registered) {
      // handle is registered
    }
  });

The callback will pass the following value on completion:

============ ==== ======
Value        Type Meaning
============ ==== ======
isRegistered Bool whether the user is registered or not
============ ==== ======

.. note::

	The **isRegistered** call will both check if the user himself has disabled remote notifications or if the parent has disabled remote notifications in
	Kids Web Services Parent Portal.
