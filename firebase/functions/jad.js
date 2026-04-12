const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.acceptFriendRequest = functions.firestore
    .document("friendRequests/{requestId}")
    .onDelete(async (snap, context) => {
        const deletedRequest = snap.data();
        const senderDocId = deletedRequest.senderID; // Sender's document ID
        const receiverEmail = deletedRequest.receiverID; // Receiver's email

        console.log("Friend Request Deleted:", deletedRequest);

        try {
            const usersCollection = admin.firestore().collection("users");

            // Fetch the receiver's document using the email
            const receiverQuery = await usersCollection.where("email", "==", receiverEmail).get();
            if (receiverQuery.empty) {
                console.error(`Receiver document not found for email: ${receiverEmail}`);
                return;
            }

            const receiverDoc = receiverQuery.docs[0];
            const receiverDocId = receiverDoc.id;
            const receiverDisplayName = receiverDoc.data().display_name; // Receiver's display name

            console.log(`Receiver Document ID: ${receiverDocId}`);
            console.log(`Receiver Display Name: ${receiverDisplayName}`);

            // Fetch the sender's document using the senderDocId
            const senderDoc = await usersCollection.doc(senderDocId).get();
            if (!senderDoc.exists) {
                console.error(`Sender document not found for ID: ${senderDocId}`);
                return;
            }

            const senderDisplayName = senderDoc.data().display_name; // Sender's display name

            console.log(`Sender Document ID: ${senderDocId}`);
            console.log(`Sender Display Name: ${senderDisplayName}`);

            // Update the friendsList for both users with display names
            const senderRef = usersCollection.doc(senderDocId);
            const receiverRef = usersCollection.doc(receiverDocId);

            await senderRef.update({
                friendsList: admin.firestore.FieldValue.arrayUnion(receiverDisplayName),
            });

            await receiverRef.update({
                friendsList: admin.firestore.FieldValue.arrayUnion(senderDisplayName),
            });

            // Log the updated friends lists
            const updatedSenderDoc = await senderRef.get();
            const updatedReceiverDoc = await receiverRef.get();

            console.log("Updated Sender Friends List:", updatedSenderDoc.data().friendsList);
            console.log("Updated Receiver Friends List:", updatedReceiverDoc.data().friendsList);

            console.log(
                `Friend request accepted: ${senderDisplayName} and ${receiverDisplayName} are now friends.`
            );
        } catch (error) {
            console.error("Error updating friendsList for both users:", error);
        }

        return null;
    });

    exports.testFirestoreAccess = functions.https.onRequest(async (req, res) => {
        try {
            const usersCollection = admin.firestore().collection("users");
            const snapshot = await usersCollection.get();
            snapshot.forEach((doc) => {
                console.log(doc.id, "=>", doc.data());
            });
            res.status(200).send("Firestore access confirmed!");
        } catch (error) {
            console.error("Error accessing Firestore:", error);
            res.status(500).send("Firestore access failed!");
        }
    });
    