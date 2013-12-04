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
                      borderColor: "#BAC2C9",
                      textColor: "#FFFFFF"
                }],
                eventRender: function(event, element) { 
                    element.find('.fc-event-title').append(" ("+event.assigned+")<br/>("+event.place+") "+event.description); 
                } 
        });
 });
