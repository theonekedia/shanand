/*
    $('#trade_index').DataTable();

});
*/

window.jQuery || document.write("<script src='jquery-ui.js'><\/script>");

function gainerOrLoser(){
  
}

function gainers(){
	  $('table tbody tr').each(function(){
    	var tr=$(this);
    	if (tr.find('td.dt_perchange').text() < 0)
      	tr.toggle();
  	});
	 }; 
function losers(){
  $('table tbody tr').each(function(){
    var tr=$(this);
    if (tr.find('td.dt_perchange').text() > 0)
      tr.toggle();
  });
}; // end for document.ready

function neutral(){
  $('table tbody tr').each(function(){
    var tr=$(this);
    if (tr.find('td.dt_perchange').text() != 0.0)
      tr.toggle();
  });
}; 

function largeCap(){
  $('table tbody tr').each(function(){
    var tr=$(this);
    if (tr.find('td.dt_marcap').text() < 40000)
      tr.toggle();
  });
}; 


function smallCap(){
  $('table tbody tr').each(function(){
    var tr=$(this);
    if (tr.find('td.dt_marcap').text() > 5000)
      tr.toggle();
  });
}; 

function grahamGtClose(){
  $('table tbody tr').each(function(){
    var tr=$(this);
    if (parseInt(tr.find('td:eq(4)').text()) > parseInt(tr.find('td:eq(11)').text()))
      tr.toggle();
  });
}; 

function near52wkLow(){
  $('table tbody tr').each(function(){
    var tr=$(this);
    if (tr.find('td:eq(15)').text() > 0.30)
      tr.toggle();
  });
};

function midCap(){
  $('table tbody tr').each(function(){
    var tr=$(this);
    if (tr.find('td.dt_marcap').text() < 5000 || tr.find('td.dt_marcap').text() > 40000)
      tr.toggle();
  });
}; 
