import 'dart:async';
import 'package:bloc/bloc.dart';
import './sentiment_by_source.dart';

class SentimentBySourceBloc extends Bloc<SentimentBySourceEvent, SentimentBySourceState> {
  @override
  SentimentBySourceState get initialState => InitialSentimentBySourceState();

  @override
  Stream<SentimentBySourceState> mapEventToState(
    SentimentBySourceEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
