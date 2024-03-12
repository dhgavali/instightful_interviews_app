import 'package:record/record.dart';

class AudioHandler{
final recorder = AudioRecorder();
// List to s
  Future<void> startRecording(String path) async {
  try{
      print("path $path");
   await recorder.start(RecordConfig(), path: path);
  }
  catch(err){
    print('error $err');
  }
  }

  Future<String?> stopRecording(String path) async {
    try{
    final recording = await recorder.stop();
    return recording;
    }
    catch(err){
      print(err);
    }
    return "error";
  }

}