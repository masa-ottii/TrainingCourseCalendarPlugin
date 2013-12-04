 $(document).ready(function() {
       $('#calendar').fullCalendar({
                 header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,basicWeek,basicDay'
                 },
                editable: false,
                timeFormat: "H:mm",
                eventSources: [{  
                      url: '/course_event',
                      textColor: "#FFFFFF"
                }],
                eventRender: function(event, element) { 
                    element.find('.fc-event-title').append("<br/>" + event.description); 
                } 
        });
 });
