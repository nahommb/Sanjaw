
String VideoChecker(String url) {

 if(url.endsWith('.mp4') || url.endsWith('.avi') || url.endsWith('.mov')|| url.endsWith('.mkv')){
  
  return 'video';
 }
 else{
  if(!url.startsWith('http')){
    return 'text';
  }
  else{
    return 'image';
  }
 }

}