import 'package:equatable/equatable.dart';

abstract class SentimentBySourceState extends Equatable {
  const SentimentBySourceState();
}

class InitialSentimentBySourceState extends SentimentBySourceState {
  @override
  List<Object> get props => [];
}
