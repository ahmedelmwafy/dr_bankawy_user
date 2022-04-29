class Order {
  String documentId;
  String oUserEmail;
  bool oIsAccepted;
  bool oIsReviewed;
  int oCreatedDate;

  Order(
      {this.documentId,
      this.oUserEmail,
      this.oIsAccepted,
      this.oIsReviewed,
      this.oCreatedDate});
}
