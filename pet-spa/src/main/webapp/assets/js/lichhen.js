

function themDV(iddv,type){
   var soluong=0;
 
   if(type=='them'){
       soluong = document.getElementById("sl"+iddv).value;
       if(soluong <= 0){
           document.getElementById("sl"+iddv).value =1;
           return;
       }
   }
    if(type=='themmoi'){
       soluong = 1;
       
   }
    if(type=='xoa'){
       soluong = 0;
       
   }
  
   
   window.location.replace("doChonDichVu.jsp?dv_id="+iddv+"&dv_sl="+soluong);
}
