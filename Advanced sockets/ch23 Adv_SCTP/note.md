###### 23.12 when to use SCTP instead of TCP ?

* Benefits of SCTP
* 1. a protocol that directly supports `multihoming`.
* 2. head-of-line blocking can be eliminated.
* 3. application layer msg boundaries are preserved.
* 4. an unordered msg service is provided.
* 5. a partially reliable service is available in some SCTP imp.
* 6. an easy migration path from TCP is provided by SCTP with its one-to-one-style IF
* 7. Many of the features of TCP are included in SCTP with two notable exceptions(half-close state and urgent data)
* 8. SCTP provides many hooks for an application to configure and tune the trasnport to match its needs on an association-by-association basis.
