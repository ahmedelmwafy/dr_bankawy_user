class Order {
  String documentId;
  String productId;
  String oUserEmail;
  bool oIsAccepted;
  bool oIsReviewed;
  int oCreatedDate;

  Order(
      {this.documentId,
      this.productId,
      this.oUserEmail,
      this.oIsAccepted,
      this.oIsReviewed,
      this.oCreatedDate});
}
