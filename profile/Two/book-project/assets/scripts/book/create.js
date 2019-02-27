class Create{
    constructor(){
        this.btn = $("#btn");
        this.init();
    }
    init(){
        this.bindEvent();
    }
    bindEvent(){
        this.btn.click(util.throttle(this.submit,1000));
    }
    submit(){
        const urlSearchParams = new URLSearchParams();
        urlSearchParams.append('isbn',$("#bookIsbn").val())
        urlSearchParams.append('name',$("#bookName").val())
        urlSearchParams.append('author',$("#bookAuthor").val())
        urlSearchParams.append('press',$("#bookPress").val())
        urlSearchParams.append('price',$("#bookPrice").val())
        urlSearchParams.append('time',$("#bookTime").val())
        urlSearchParams.append('image',$("#bookImgUrl").val())
        urlSearchParams.append('introduction',$("[name='book_introduction']").val())
        fetch('/book/create',{
            method : "POST",
            body : urlSearchParams,
        }).then(res=>res.json())
          .then(json=>{
              if(json.code == 1 &&json.message == 'ok'){
                  location.href = '/book';
              }else{
                  alert('新增图书失败!');
              }
          }).catch(err=>{
                alert("新增图书失败！");
          })
    }
}

export default Create;