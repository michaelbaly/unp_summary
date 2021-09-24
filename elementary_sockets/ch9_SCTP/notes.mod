##### 9.2 IF models
* two types of SCTP sockets: one-to-one and one-to-many
* things to consider when chose the type:
* + 1 server type --- interative or concurrent?
* + 2 how many socket desc does the server wish to manage?
* + 3 is it important to optimize the association setup to enable data on the third packet of the four-way handshake?
* + 4 how many connection state does the app wish to maintain?
