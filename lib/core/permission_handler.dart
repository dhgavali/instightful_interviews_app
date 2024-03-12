import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionManager{
  static Future<bool> checkPermision()async{
    
    PermissionStatus cameraStatus = await Permission.camera.status;
    PermissionStatus externalStorageStatus = await Permission.manageExternalStorage.status;
    PermissionStatus microphoneStatus = await Permission.microphone.status;

      if(cameraStatus.isGranted && externalStorageStatus.isGranted && microphoneStatus.isGranted){
        return true;

      }
      else{
return false;
      }
      
  }

  static Future<bool> requestPermissions() async{
  PermissionStatus cameraStatus =   await Permission.camera.request();
    PermissionStatus externalStorageStatus = await  Permission.manageExternalStorage.request(); 

    if(cameraStatus.isGranted && externalStorageStatus.isGranted){
      return true;
      } 
    return false;
  }

  static Future<bool> requestAudioPermission() async{
     bool permissionStatus = await Permission.microphone.isGranted;

     if(permissionStatus){
      return true;
     }
     else{
      Permission.microphone.request();
      return true;
     }

  }
}