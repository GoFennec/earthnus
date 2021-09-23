ClassicEditor 

    .create( document.querySelector( '#CAMB_CONTENT' ) ) 

    .then( editor => { 

        console.log( editor ); 

    } ) 

    .catch( error => { 

        console.error( error ); 

    } );