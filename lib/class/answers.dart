class GettingStarted {
  final List<String> _answers;
  GettingStarted(this._answers);

  Map convertToJson() {
    return this._answers.asMap();
  }
}
