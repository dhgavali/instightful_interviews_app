import 'package:permission_handler/permission_handler.dart';

class PermissionManager{
  static Future<bool> checkPermision()async{
    
    PermissionStatus cameraStatus = await Permission.camera.status;
    PermissionStatus externalStorageStatus = await Permission.manageExternalStorage.status;
    PermissionStatus storagePermission  = await Permission.storage.status;
    PermissionStatus microphoneStatus = await Permission.microphone.status;
    
    print("bool  status: ${storagePermission.isGranted} ${externalStorageStatus.isGranted}");
      if(cameraStatus.isGranted && externalStorageStatus.isGranted && microphoneStatus.isGranted && storagePermission.isGranted){
        return true;

      }
      else{
       
return false;
      }
      
  }


static Future<bool> checkStoragePermission() async{
 bool permision = await Permission.manageExternalStorage.isGranted;
 bool permssion2 = await Permission.storage.isGranted;

 if(permision && permssion2){
  print("one");
return permision && permssion2;
 }
 else{
  print("two");
  await requestStoragePermission();
  return true;
 }
 
}

// request all permissions
static Future<bool> requestPermissions()async{
  bool p1 = await requestCameraPermission();
  bool p2 = await requestAudioPermission();
  bool p3 =await requestStoragePermission();
  if(p1 && p2 && p3){
    return true;
  }
  else{
    return false;
  }

}

// camera permission
  static Future<bool> requestCameraPermission() async{
  PermissionStatus cameraStatus =   await Permission.camera.request();

  
    if(cameraStatus.isGranted){
      return true;
      } 
    return false;
  }


// audio permission
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

  // storage permission
  static Future<bool> requestStoragePermission() async{
    print("function called");
    PermissionStatus permision = await Permission.manageExternalStorage.request();
    PermissionStatus permision2 = await Permission.storage.request();
    //  await openAppSettings();
    // return permision2.isGranted; 
    // return true;
    if(permision.isGranted && permision2.isGranted){
      print("${permision.isDenied} ${permision2.isGranted}");
      return true;
    }
    else{
      return false;
    }
    
  }
}