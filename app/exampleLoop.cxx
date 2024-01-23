#include <nd280EventLoop.hxx>
#include <TH1F.h>
#include <TTree.h>
#include <TFile.h>
#include <TPad.h>

//oaEvent
#include <THandle.hxx>
#include <THitSelection.hxx>


class TMyEventLoop: public ND::TND280EventLoopFunction {
    public:
        TMyEventLoop() {}
        virtual ~TMyEventLoop() {}

        void Initialize() {
            fNumberGlobalObjects = new TH1F("NumberGlobalObjects", "Number of Global Objects",25,-0.5,24.5);
            fOutputFile = new TFile("timing.root", "RECREATE");
            fOutputTree = new TTree("timing", "timing");
            // define TTree structure
            fOutputTree->Branch("NTracks",&fNTracks);
	    fOutputTree->Branch("HitTimeVector",&fHitTimeVector);
        }

        bool operator ()  (ND::TND280Event& event){
	    	
	    
            ND::THandle<ND::THitSelection> sfgd(event.GetHitSelection("sfgd"));
            if(sfgd){
                TMyEventLoop::FillTimeTree(sfgd);
            }
            
            return true;
        }

	void FillTimeTree(ND::THandle<ND::THitSelection> hitsel){
	    ND::THitSelection::iterator hit_iter;
	    fHitTimeVector.clear();
  	    for (hit_iter=hitsel->begin(); hit_iter!=hitsel->end(); ++hit_iter){
    	        ND::THandle<ND::THit> hit = (*hit_iter);
	        if (hit->HasValidTime()){
		double time = hit->GetTime();
		fHitTimeVector.push_back(time);
		std::cout<<"time: "<<time<<std::endl;
		}
	    }	
	    fOutputTree->Fill();	

	}

        void Finalize(ND::TND280Output * const file) {
            fNumberGlobalObjects->Draw();
            gPad->Print("NumberGlobalObjects.eps");
            gPad->SaveAs("NumberGlobalObjects.eps");
            fOutputFile->cd();
            fOutputTree->Write();
            std::cout<<"Written output TTree"<<std::endl;
        }

    private:
        TH1F* fNumberGlobalObjects;
        TFile* fOutputFile;
        TTree* fOutputTree;
        int fNTracks;
	std::vector<double> fHitTimeVector;
};
int main(int argc, char **argv) {
    std::cout<<"hello"<<std::endl;
    TMyEventLoop userCode;
    nd280EventLoop(argc,argv,userCode);
}
