$(document).ready(function(event) {
    $('.delete_request_btn').on('click', function(){
       $('#request-id').val($(this).attr('data-id'));
       $('#confirm_delete_request').modal('show'); 
    });    
    
    $('.delete_appointement_btn').on('click', function(){
       $('#appointement-id').val($(this).attr('data-id'));
       $('#confirm_delete_appointement').modal('show'); 
    }); 
    
    $('.set_status_btn').on('click', function(){
       $('#appointement-id2').val($(this).attr('data-id'));
       $('#set_appointement_status').modal('show'); 
       $('#a_status').val($(this).parent().parent().parent().find('.status').attr('data-id'));
    }); 
    
    
    
    $('.request_details_btn').on('click', function(){
       $('#request_id2').val($(this).attr('data-id'));
       $('#request_details_modal').modal('show'); 
       $('#m_estate_type').val($(this).parent().parent().parent().find('.estate_type').html());
       $('#m_show_type').val($(this).parent().parent().parent().find('.show_type').html());
       $('#m_estate_address').val($(this).parent().parent().parent().find('.estate_address').html());
       $('#m_price').val($(this).parent().parent().parent().find('.price').html());
       $('#m_seller_name').val($(this).parent().parent().parent().find('.seller_name').html());
       $('#m_estate_notes').val($(this).parent().parent().parent().find('.estate_notes').html());
       $('#m_estate_size').val($(this).parent().parent().parent().find('.estate_size').html());
       $('#m_seller_mobile1').val($(this).parent().parent().parent().find('.seller_phone_1').html());
       $('#m_seller_mobile2').val($(this).parent().parent().parent().find('.seller_phone_2').html());
       $('#m_status').val($(this).parent().parent().parent().find('.status').attr('data-id'));
       $('#m_file_url').attr('href', $(this).parent().parent().find('.download_contract_btn').attr('href'));
    });
 
});
