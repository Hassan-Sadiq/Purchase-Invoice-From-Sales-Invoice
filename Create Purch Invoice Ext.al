codeunit 70000 "Create Purch Invoice Ext"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch. Doc. From Sales Doc.", 'OnCopySalesLinesToPurchaseLinesOnLineTypeValidate', '', false, false)]
    procedure OnCopySalesLinesToPurchaseLinesOnLineTypeValidate(var PurchaseLine: Record "Purchase Line"; SalesLine: Record "Sales Line"; var IsHandled: Boolean)
    begin
        IsHandled := true;
        if SalesLine.Type = "Sales Line Type"::"G/L Account" then
            PurchaseLine.Type := "Purchase Line Type"::"G/L Account"
        else
            if SalesLine.Type = "Sales Line Type"::"Resource" then
                PurchaseLine.Type := "Purchase Line Type"::"Resource";
    end;
}