%1.    Name file 
filename='R0tradingStrategyResultsAvgTesterR1.xlsx'
% 2.    Asign starting cell in spreadsheet
A=4;
toplefts = [excel_row];
try
%Moving window
range = XLSrange(size(A),[excel_row,excel_columnc]);
xlswrite(filename,w,1,range)
%Shift
range = XLSrange(size(A),[excel_row,excel_columnd]);
xlswrite(filename,shift,1,range)
%Movav
range = XLSrange(size(A),[excel_row,excel_columne]);
xlswrite(filename,ma,1,range)
%Entries
range = XLSrange(size(A),[excel_row,excel_columnf]);
xlswrite(filename,Entries_Accuracy,1,range)
%Exits
range = XLSrange(size(A),[excel_row,excel_columng]);
xlswrite(filename,Exits_Accuracy,1,range)
%Profitability
range = XLSrange(size(A),[excel_row,excel_columnh]);
xlswrite(filename,overall_profit_or_loss,1,range)
%Buys
range = XLSrange(size(A),[excel_row,excel_columni]);
xlswrite(filename,number_of_buys,1,range)
%Sells
range = XLSrange(size(A),[excel_row,excel_columnj]);
 xlswrite(filename,number_of_sells,1,range)
catch
end