import create from 'zustand';

interface Alert {
    id: number;
    type: string;
    location: string;
    description: string;
}

interface Report {
    id: number;
    title: string;
    patientName: string;
    createdAt: string;
}

interface EMSStore {
    activeReports: Report[];
    pendingAlerts: Alert[];
    setActiveReports: (reports: Report[]) => void;
    setPendingAlerts: (alerts: Alert[]) => void;
}

export const useEMSStore = create<EMSStore>((set) => ({
    activeReports: [],
    pendingAlerts: [],
    setActiveReports: (reports) => set({ activeReports: reports }),
    setPendingAlerts: (alerts) => set({ pendingAlerts: alerts })
}));
