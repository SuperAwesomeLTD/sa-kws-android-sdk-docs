Associate a parent email
========================

You can associate a parent email for the user you're authenticated as by calling:

.. code-block:: java

  KWS.sdk.submitParentEmail (MainActivity, "parent@test.com", new KWSParentEmailInterface() {
    @Override
    public void submitted (KWSParentEmailStatus status) {

      switch (type) {
        case Success:
          break;
        case Invalid:
          break;
        case NetworkError:
          break;
      }
    }
  });

The callback will pass the following value on completion:

====== ==================== ======
Value                       Type Meaning
====== ==================== ======
status KWSParentEmailStatus End status of the operation
====== ==================== ======

The **status** parameter may have the following values:

============ ======
Value        Meaning
============ ======
Success      Submitted parent email successfully
Invalid      Not a valid email
NetworkError Other network error
============ ======

.. note::

  Once the parent email is successfully submitted you'll be able to request permissions.

There's also a quick hand version of this method that displays a standard system popup to enable the user to submit an email:

.. code-block:: java

  KWS.sdk.submitParentEmailWithPopup (MainActivity, new KWSParentEmailInterface() {
    @Override
		  public void submitted (KWSParentEmailStatus status) {
				// handle email submit
      }
  });
