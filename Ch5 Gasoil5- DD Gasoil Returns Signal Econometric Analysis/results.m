%%1.    This section will print to the general results Excel spreadsheet. 
filename='results.xlsx'

%%2.    Create the loop to write to XLS at each incident number
A = 4;
for event_number = 1:1:event_number;
%     te=1:1:size(time_event);
%     date = 1:1:size(date_event);
%     time_event(te); 
    excel_row=excel_row+1; 
    toplefts = [excel_row];

%Event Number
range = XLSrange(size(A),[toplefts,2]);
xlswrite(filename,event_number,3,range)
%Time
range = XLSrange(size(A),[toplefts,3]);
xlswrite(filename,date_event(event_number),3,range)
%Date
range = XLSrange(size(A),[toplefts,4]);
xlswrite(filename,date_event(event_number),3,range) %F82
%Order Type (Buy or Sell)
range = XLSrange(size(A),[toplefts,5]);
xlswrite(filename,order_type(event_number),3,range) %G82
% %Order Number ....come back to
% range = XLSrange(size(A),[toplefts,6]);
% xlswrite(filename,'NA',3,range)
% %Size...come back to
% range = XLSrange(size(A),[toplefts,7]);
% xlswrite(filename,'NA',3,range)
%Price
range = XLSrange(size(A),[toplefts,8]);
 xlswrite(filename,order_price(event_number),3,range)
end