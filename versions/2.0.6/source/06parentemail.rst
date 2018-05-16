Associate a parent email
========================

You can associate a parent email for the user you're authenticated as by calling:

.. code-block:: java

  KWS.sdk.submitParentEmail (MainActivity, "parent@test.com", new KWSParentEmailInterface() {
    @Override
    public void submitted (boolean success) {
      // handle email submit
    }
  });

The callback will pass the following value on completion:

========= ==== ======
Value     Type Meaning
========= ==== ======
success   Bool wether the network operation succeeded
========= ==== ======

.. note::

  Once the parent email is successfully submitted you'll be able to request permissions.

There's also a quick hand version of this method that displays a standard system popup to enable the user to submit an email:

.. code-block:: java

  KWS.sdk.submitParentEmailWithPopup (MainActivity, new KWSParentEmailInterface() {
    @Override
		  public void submitted (boolean success) {
				// handle email submit
      }
  });
