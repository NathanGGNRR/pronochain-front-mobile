import 'package:jwt_decoder/jwt_decoder.dart';

String decodeToken() {
  String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiLCJhdWQiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiLCJqdGkiOiI3NTczZWVjOTk4ZDVjODM5NWYwMTJkOWRkNTMyODNkNiIsImlhdCI6MTY1NDg1MjEzMC4yMDYyNjQsIm5iZiI6MTY1NDg1MjEzMC4yMDYyNjQsImV4cCI6MTY1NDg4ODEzMC4yMDYyNjQsInN1YiI6IjIiLCJtb2RlbCI6IkFwcFxcTW9kZWxzXFxVc2VyIiwidXNlciI6eyJ1c2VyX2lkIjoyLCJ1c2VybmFtZSI6ImNodWdvbiJ9fQ.NhYPu30PNULmFlky5qSIAqYH2b26JtrKqulU6tDeCF8";
  Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
  Map<String, dynamic> user = decodedToken["user"];
  String username = user["username"];
  return username;
}
