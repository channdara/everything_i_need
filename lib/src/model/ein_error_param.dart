class EinErrorParam {
  EinErrorParam(this.code, this.message);

  final int code;
  final String message;

  bool get isUnauthorized => code == 401;
}
