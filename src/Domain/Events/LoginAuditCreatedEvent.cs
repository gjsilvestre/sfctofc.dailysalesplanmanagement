using SFCTOFC.DailySalesPlanManagementDomain.Identity;

namespace SFCTOFC.DailySalesPlanManagementDomain.Events;

    public class LoginAuditCreatedEvent : DomainEvent
    {
        public LoginAuditCreatedEvent(LoginAudit item)
        {
            Item = item;
        }

        public LoginAudit Item { get; }
    }

