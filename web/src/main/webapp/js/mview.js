var mydiv = $('#mylist > div');
var codyView = $('#codyView > div');


template0Src = $('#mytemp').html();
template0Engine = Handlebars.compile(template0Src);

template3Src = $('#templete3').html();
template3Engine = Handlebars.compile(template3Src);






load2();

function load2() {

    

    /*if (options == undefined) options = {};
    options.pn = pageNo;*/

    
    var index = location.href.indexOf('?');
    var qs = location.href.substr(index + 1);
    var arr = qs.split('=');
    
  
    $.ajax('../json/member/' + arr[1], {
        method: 'GET',
       /* data: options,*/
        dataType: 'json',
        success: (result) => {
            console.log(result);
             
            mydiv.html(template0Engine(result));
           
          /*  
            currPageNo = result.pageNo;
            currBtn.html(currPageNo);*/
       
            
            
    /*        if (result.pageNo == 1) {
                $(prevBtn.parent()).addClass("disabled");
            } else {
                $(prevBtn.parent()).removeClass("disabled");
            }
            
            if (result.lastPageNo == result.pageNo) {
                $(nextBtn.parent()).addClass("disabled");
            } else {
                $(nextBtn.parent()).removeClass("disabled");
            }*/
        },
        error: () => {
            console.log('서버 실행 오류!');
        }
    });
    }



function modalViewFunction(contentNo,writerNo) {
    
    
    $.ajax('../json/friend/list', {
        data: {
            codyNo : contentNo,
            codyWno : writerNo
        },
        dataType: 'json',
        success: (result) => {
         
            
            codyView.html(template3Engine(result));
            if(result.login.m_no == 0){
                $('#loginmodal').modal('show')
            }else{
                $('#bgmodal').modal('show')
            }
            
           
            
            /*--------------------------- 덧글등록  ---------------------------------------------*/
            var commentBtn =  $('#commentBtn');
            
            
            
            commentBtn.click((event) => {
                
                var commentForm = new FormData($("#commentForm")[0]);
                
                $.ajax('../json/cody_comment/add', {
                    /* method: 'GET', */
                    data: commentForm,
                    method: 'POST',
                    processData : false,
                    contentType : false,
                    dataType: 'json',
                    success: (result) => {
                      
                    },
                    error: () => {
                        console.log('덧글 실행 오류2!');
                    }
                });
               
            });

            console.log(result);
            for (var comm of result.comment) {
                const commentdelete = $('#commentdeleteBtn' + comm.com_no);
                commentdelete.click(() => {
                    
                    $.ajax('../json/cody_comment/delete', {
                        data: {
                            com_no : comm.com_no
                        },
                        dataType: 'json',
                        success: (result) => {
                           
                            $.ajax('../json/friend/list', {
                                data: {
                                    codyNo : contentNo,
                                    codyWno : writerNo
                                },
                                dataType: 'json',
                                success: (result) => {
                                    
                                    codyView.html(template3Engine(result));
                                    
                                    $('.bd-example-modal-lg').modal('show');
                                },
                                error: () => {
                                    console.log('덧글 실행 오류!');
                                }
                            });
                        },
                        error: () => {
                            console.log('덧글 삭제 오류!');
                        }
                    });
                   
                });
            }
            
         
           
    },
    error: () => {
        window.alert('서버실행오류');
    }
});
}



$('#main').load('../header.html', () => {
    
    load2();
});


 






