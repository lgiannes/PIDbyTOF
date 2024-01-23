// Example program.
// This program will retrieve recon information;
// Specifically it will print the reconstructed momentum and
// position for the first object in the global reconstruction.
// It will also list the sub-detectors used by this reconstructed object.
// It will also histogram the number of globally reconstructed objects.

// Include to get Event Loop.
#include <nd280EventLoop.hxx>

#include <TG4Trajectory.hxx>
#include <TReconPID.hxx>
#include <TReconVertex.hxx>
#include <TReconCluster.hxx>
#include <TReconTrack.hxx>
#include <TReconHit.hxx>
#include <TDataHit.hxx>
#include <TReconShower.hxx>
#include <TReconBase.hxx>
#include "ReconObjectUtils.hxx"
// #include "ReconPrintout.hxx"

// Includes for ROOT classes
#include <TH1F.h>
#include <TPad.h>
#include <TTree.h>
#include <TFile.h>

class TMyEventLoop: public ND::TND280EventLoopFunction {
    public:
        TMyEventLoop(std::string path) {
            size_t found = path.find_last_of("/\\"); // Look for the last occurrence of '/' or '\'
            if (found != std::string::npos) {
                fInputDir = path.substr(0, found); // Extract the substring before the last separator
            }else{
                std::cout<<"No path separator found in "<<path<<". Setting output dir as working dir."<<std::endl;
                fInputDir = ".";
            }            
        }
        virtual ~TMyEventLoop() {}

        void Initialize() {
            // create a TTree to store the SFGD hits
            fOutputFullPath = fInputDir + "/SFGDHitTimes.root";
            fOutFile = new TFile(fOutputFullPath.c_str(),"RECREATE");
            fSFGDTree = new TTree("SFGDTree","SFGDTree");
            fSFGDHitTimes = new std::vector<double>;
            fSFGDHitXs = new std::vector<double>;
            fSFGDHitYs = new std::vector<double>;
            fSFGDHitZs = new std::vector<double>;
            fSFGDTree->Branch("SFGDHitTime",&fSFGDHitTime,"SFGDHitTime/D");
            fSFGDTree->Branch("SFGDHitTimes",&fSFGDHitTimes);
            fSFGDTree->Branch("SFGDHitTimesError",&fSFGDHitTimesError);
            fSFGDTree->Branch("SFGDHitXs",&fSFGDHitXs);
            fSFGDTree->Branch("SFGDHitYs",&fSFGDHitYs);
            fSFGDTree->Branch("SFGDHitZs",&fSFGDHitZs);
            fSFGDTree->Branch("PIDMomentum",&fPIDMomentum,"PIDMomentum/D");
            fSFGDTree->Branch("ParticleId",&fParticleId,"ParticleId/I");
            fSFGDTree->Branch("PIDweight",&PIDweight,"PIDweight/D");
            fSFGDTree->Branch("Charge",&fCharge,"Charge/D");
            fSFGDTree->Branch("Direction",&fDirection);
            fSFGDTree->Branch("Position",&fPosition);

            fEvCounter = 0;
            fPIDcounter = 0;
            fObjectCounter = 0;
            fHitCounter = 0;
            std::cout<<"Initialize() called"<<std::endl;
        }

        bool operator () (ND::TND280Event& event) {

            ND::TReconBase::Status det  = ND::TReconBase::kSFG;
            double timeUncLimit = 100.0; // ns
            
            // Get the algoritm result for global recon
            ND::THandle<ND::TAlgorithmResult> GlobalResult = event.GetFit("sfgRecon");
            // Check that result exists
            if(!GlobalResult){
                std::cout << "-*-*-*- ev. "<<fEvCounter<<": No global algorithm result in this event." << std::endl;
                return true;
            }
            // Get objects (tracks, PIDs, ...) reconstructed in the SFGD
            ND::THandle<ND::TReconObjectContainer> sfgdObjects = GlobalResult->GetResultsContainer("final");
            std::vector<ND::THandle<ND::TReconPID>> sfgdPIDs;
            // explore container
            if(sfgdObjects){
                std::cout <<  "----------------------------------------------\n-event "
                          <<fEvCounter<< ": "<< sfgdObjects->end()-sfgdObjects->begin()<<" objects found in this event"<<std::endl;
                fObjectCounter += sfgdObjects->end()-sfgdObjects->begin();
                // loop over objects
                for(ND::TReconObjectContainer::iterator it = sfgdObjects->begin(); it != sfgdObjects->end(); ++it){
                    // get object
                    ND::THandle<ND::TReconBase> object = *it;
                    std::cout<<"-- object "<<it-sfgdObjects->begin()<<std::endl;
                    try 
                    {
                        ND::THandle<ND::TReconState> tstate = object->GetState();
                    } catch (ND::EReconObject e)
                    {
                        std::cout << "-*-*-*- TReconBase with no state. Skip object !!" << std::endl;
                        continue;
                    }

                    // check if object is a pid
                    ND::THandle<ND::TReconPID> pid = object;
                    if(pid){
                        std::cout<<"--- object "<<it-sfgdObjects->begin()<<" is a PID";
                        // if the pid uses the SFGD, add it to the list
                        if(pid->UsesDetector(ND::TReconBase::kSFG)){ 
                            std::cout << ":SFGD";    
                            sfgdPIDs.push_back(pid);
                        }
                        if(pid->UsesDetector(ND::TReconBase::kFGD)) std::cout << ":FGD";    
                        if(pid->UsesDetector(ND::TReconBase::kTPC1)) std::cout << ":TPC1";    
                        if(pid->UsesDetector(ND::TReconBase::kSMRD)) std::cout << ":SMRD";    
                        if(pid->UsesDetector(ND::TReconBase::kHAT)) std::cout << ":HAT";    
                        if(pid->UsesDetector(ND::TReconBase::kTOF)) std::cout << ":TOF";    
                        if(pid->UsesDetector(ND::TReconBase::kTECal)) std::cout << ":ECAL";  
                        if(pid->UsesDetector(ND::TReconBase::kPECal)) std::cout << ":P0D-ECAL";  
                        std::cout << std::endl;
                    }

                    // check if object is a track
                    ND::THandle<ND::TReconTrack> track = object;
                    if(track){
                        std::cout<<"--- object "<<it-sfgdObjects->begin()<<" is a track";
                        // get the detectors involved
                        if(track->UsesDetector(ND::TReconBase::kSFG)) std::cout << ":SFGD";    
                        if(track->UsesDetector(ND::TReconBase::kFGD)) std::cout << ":FGD";    
                        if(track->UsesDetector(ND::TReconBase::kTPC1)) std::cout << ":TPC1";    
                        if(track->UsesDetector(ND::TReconBase::kSMRD)) std::cout << ":SMRD";    
                        if(track->UsesDetector(ND::TReconBase::kHAT)) std::cout << ":HAT";    
                        if(track->UsesDetector(ND::TReconBase::kTOF)) std::cout << ":TOF";    
                        if(track->UsesDetector(ND::TReconBase::kTECal)) std::cout << ":ECAL";    
                        if(track->UsesDetector(ND::TReconBase::kPECal)) std::cout << ":P0D-ECAL";    
                        std::cout << std::endl;
                    }

                    // check if object is a shower
                    ND::THandle<ND::TReconShower> shower = object;
                    if(shower){
                        std::cout<<"--- object "<<it-sfgdObjects->begin()<<" is a shower";
                        // if the pid uses the SFGD, add it to the list
                        if(shower->UsesDetector(ND::TReconBase::kSFG)) std::cout << ":SFGD";    
                        if(shower->UsesDetector(ND::TReconBase::kFGD)) std::cout << ":FGD";    
                        if(shower->UsesDetector(ND::TReconBase::kTPC1)) std::cout << ":TPC1";    
                        if(shower->UsesDetector(ND::TReconBase::kSMRD)) std::cout << ":SMRD";    
                        if(shower->UsesDetector(ND::TReconBase::kHAT)) std::cout << ":HAT";    
                        if(shower->UsesDetector(ND::TReconBase::kTOF)) std::cout << ":TOF";    
                        if(shower->UsesDetector(ND::TReconBase::kTECal)) std::cout << ":ECAL";  
                        if(shower->UsesDetector(ND::TReconBase::kPECal)) std::cout << ":P0D-ECAL";  
                        std::cout << std::endl;
                    }

                    // check if object is a vertex
                    ND::THandle<ND::TReconVertex> vertex = object;
                    if(vertex){
                        std::cout<<"--- object "<<it-sfgdObjects->begin()<<" is a vertex";
                        // if the pid uses the SFGD, add it to the list
                        if(vertex->UsesDetector(ND::TReconBase::kSFG)) std::cout << ":SFGD";    
                        if(vertex->UsesDetector(ND::TReconBase::kFGD)) std::cout << ":FGD";    
                        if(vertex->UsesDetector(ND::TReconBase::kTPC1)) std::cout << ":TPC1";    
                        if(vertex->UsesDetector(ND::TReconBase::kSMRD)) std::cout << ":SMRD";    
                        if(vertex->UsesDetector(ND::TReconBase::kHAT)) std::cout << ":HAT";    
                        if(vertex->UsesDetector(ND::TReconBase::kTOF)) std::cout << ":TOF";    
                        if(vertex->UsesDetector(ND::TReconBase::kTECal)) std::cout << ":ECAL";  
                        if(vertex->UsesDetector(ND::TReconBase::kPECal)) std::cout << ":P0D-ECAL";  
                        std::cout << std::endl;
                    }
                    // get SFGD constituents
                    ND::TReconObjectContainer sfgConstituents = ReconObjectUtils::GetAllConstituentsInDetector(object, det);
                    // this should be 1 ...
                    if (sfgConstituents.size() != 1){
                        std::cout << "-*-*-*- TReconBase with "<< sfgConstituents.size() <<" SFGD constituent. Skip object !!" << std::endl;
                        continue;
                    } 
                }
            }else{
                std::cout <<  "-*-*-*- ev. "<<fEvCounter<<": No recoObjects container found in this event." << std::endl;
            }
            // get the SFGD information for each PID in the list
            std::cout<<"> "<<sfgdPIDs.size()<<" SFGD PIDs found in this event"<<std::endl;
            fPIDcounter += sfgdPIDs.size();
            for(int i=0; i<sfgdPIDs.size(); i++){
                // get the global pid object
                ND::THandle<ND::TReconPID> pid = sfgdPIDs.at(i);
                // get momentum
                fPIDMomentum = pid->GetMomentum();
                // get particleID
                fParticleId = pid->GetParticleId();
                // get PID weight
                PIDweight = pid->GetPIDWeight();
                // get direction
                fDirection = pid->GetDirection();
                // get position
                fPosition = pid->GetPosition();
                // get charge
                fCharge = pid->GetCharge();
                // get ALL the hits 
                ND::THandle<ND::THitSelection> hits = pid->GetHits();
                std::cout<<">> "<<hits->size()<<" hits found in pid "<<i<<std::endl;
                fHitCounter += hits->size();
                int countIN=0, countOUT=0;
                for(int j=0; j<hits->size(); j++){
                    double hitTimeFromContributors = 0.;
                    double usedHitTime = 0.;
                    ND::THandle<ND::THit> hit = hits->at(j);
                    //std::cout<<">>> hit "<<j<<" has "<<hit->GetContributorCount()<<" contributors"<<std::endl;
                    for(int i_contrib=0; i_contrib<hit->GetContributorCount(); i_contrib++){
                        ND::THandle<ND::THit> contrib = hit->GetContributor(i_contrib);
                        if (contrib == nullptr) continue;
                        if(contrib->HasValidTime()){
                            // std::cout<<">>>> contributor "<<i_contrib<<" has hitTime: "<< contrib->GetTime() <<std::endl;
                        }else{
                            // std::cout<<">>>> contributor "<<i_contrib<<" has no valid calibrated time"<<std::endl;
                        }
                        if(contrib->HasValidCharge()){
                            // std::cout<<">>>> contributor "<<i_contrib<<" has hitCharge: "<< contrib->GetCharge() <<std::endl;
                        }else{
                            // std::cout<<">>>> contributor "<<i_contrib<<" has no valid calibrated charge"<<std::endl;
                        }
                        // get the hit time as the charge-averaged time of the contributing hits 
                        hitTimeFromContributors += contrib->GetTime()*contrib->GetCharge();
                    }
                    hitTimeFromContributors /= hit->GetCharge();
                    if (hit->HasValidTime()){
                        // comment out for less verbosity
                        //std::cout<<">>> hit "<<j<<" time "<<hit->GetTime()<<" +- "<<hit->GetTimeUncertainty() <<std::endl;
                        if(hit->GetTimeUncertainty()>timeUncLimit){
                            countOUT++;
                        }else{
                            countIN++;

                            // usedHitTime = hitTimeFromContributors; // This is definitely not correct. It probably does not take into account the transit time
                            usedHitTime = hit->GetTime();
                            
                            fSFGDHitTimes->push_back(usedHitTime);
                            fSFGDHitTimesError->push_back(hit->GetTimeUncertainty());
                            //cout<<">>>>> hit "<<j<<" time "<<hit->GetTime()<<" +- "<<hit->GetTimeUncertainty() <<std::endl;
                            fSFGDHitXs->push_back(hit->GetPosition().X());
                            fSFGDHitYs->push_back(hit->GetPosition().Y());
                            fSFGDHitZs->push_back(hit->GetPosition().Z());
                        }
                    }else{
                        std::cout<<"-*-*-*- hit "<<j<<" has no valid calibrated time"<<std::endl;
                    }
                }
                std::cout<<">>> "<<countIN <<" hits with time uncertainty < "<< timeUncLimit <<" ns"<<std::endl;
                std::cout<<">>> "<<countOUT<<" hits with time uncertainty > "<< timeUncLimit <<" ns"<<std::endl;
                fSFGDTree->Fill();
                fSFGDHitTimes->clear();
                fSFGDHitTimesError->clear();
                fSFGDHitXs->clear();
                fSFGDHitYs->clear();
                fSFGDHitZs->clear();
            }

            std::cout<<" Finished processing event "<<fEvCounter <<std::endl;            
            fEvCounter++;
            return true;

        }

        void Finalize(ND::TND280Output * const file) {
            fOutFile->cd();
            fSFGDTree->Write();
            fOutFile->Close();
            std::cout<<"Finalize(): "<<fEvCounter<<" events processed"<<std::endl;
            std::cout<<"Finalize(): "<<fPIDcounter<<" SFGD PIDs found"<<std::endl;
            std::cout<<"Finalize(): "<<fObjectCounter<<" total objects found"<<std::endl;
            std::cout<<"Finalize(): "<<fHitCounter<<" total hits found"<<std::endl;
            std::cout<<"Finalize(): Output TTree saved in "<<fOutputFullPath<<std::endl;
        }

    private:
        std::string fInputDir;
        std::string fOutputFullPath;
        TTree *fSFGDTree;
        TFile* fOutFile;
        double fSFGDHitTime;
        std::vector<double> *fSFGDHitTimes= nullptr;
        std::vector<double> *fSFGDHitTimesError= nullptr;
        std::vector<double> *fSFGDHitXs= nullptr;
        std::vector<double> *fSFGDHitYs= nullptr;
        std::vector<double> *fSFGDHitZs= nullptr;
        double fPIDMomentum;
        ND::TReconPID::ParticleId fParticleId;
        double PIDweight;
        double fCharge;
        TVector3 fDirection;
        TLorentzVector fPosition;


        int fEvCounter;
        double fSFGDPIDTime;
        int fPIDcounter;
        int fObjectCounter;
        int fHitCounter;
};

int main(int argc, char **argv) {
    TMyEventLoop userCode(argv[1]);
    nd280EventLoop(argc,argv,userCode);
}




