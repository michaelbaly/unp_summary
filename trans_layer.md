* TCP must keep a copy of our data until it is acknowledged by the peer
* the successful return from a write to a TCP socket only tells us that we can reuse our application buffer
* [note]discard data in send buffer
* UDP send buffer doesn't really exist
