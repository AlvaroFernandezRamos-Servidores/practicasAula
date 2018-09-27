document.addEventListener("DOMContentLoaded", function() {
    let dias = document.getElementById('checkDias');
    let dias_content = '';
    for(let i=0;i<31;i++){
        dias_content+='<option value="'+(i+1)+'">'+(i+1)+'</option>';
    }
    dias.innerHTML=dias_content;
    let meses = document.getElementById('checkMeses');
    let meses_content = '';
    for(let i=0;i<12;i++){
        meses_content+='<option value="'+(i+1)+'">'+(i+1)+'</option>';
    }
    meses.innerHTML=meses_content;
    let anios = document.getElementById('checkAnios');
    let anios_content = '';
    for(let i=1970;i<2018;i++){
        anios_content+='<option value="'+(i+1)+'">'+(i+1)+'</option>';
    }
    anios.innerHTML=anios_content;
});