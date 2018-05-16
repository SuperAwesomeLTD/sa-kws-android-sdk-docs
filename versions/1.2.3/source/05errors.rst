Errors
======

User has no parent email associated in KWS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When checking that the user is allowed remote notifications, if the SDK does not encounter a parent email, the following
delegate method will be called:

.. code-block:: java

    @Override
    public void didFailBecauseKWSCouldNotFindParentEmail() {

    }

In this case, you'll then need to call the corresponding KWS email function:

.. code-block:: java

    @Override
    public void didFailBecauseKWSCouldNotFindParentEmail() {
        String email = "example@parent.com";
        KWS.sdk.submitParentEmail(email);
    }

If all goes well, the preceding **isAllowedToRegisterForRemoteNotifications** function will get called and the process will go
on as usual.

User has no KWS permission for remote notifications
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In this case a parental authority in KWS has disabled remote notification permission for this user, and
the following delegate method will get called:

.. code-block:: java

    @Override
    public void didFailBecauseKWSDoesNotAllowRemoteNotifications() {
        // handle scenario
    }

Generic error
^^^^^^^^^^^^^

Sometimes due to different conditions (no network, invalid data, etc) the whole process might fail.

In this case the following delegate method will get called:

.. code-block:: java

    @Override
    public void didFailBecauseOfError() {

    }
