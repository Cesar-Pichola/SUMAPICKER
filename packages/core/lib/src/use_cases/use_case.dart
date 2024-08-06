// ignore_for_file: public_member_api_docs, one_member_abstracts

abstract class UseCase<Type, Params> {
  Type call({required Params params});
}
